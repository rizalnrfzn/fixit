import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/features/presentation/pages/order/order_step/cubit/post_review_cubit.dart';
import 'package:fixit/utils/ext/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PostReviewContainer extends StatefulWidget {
  const PostReviewContainer({super.key, required this.order});

  final RepairOrder order;

  @override
  State<PostReviewContainer> createState() => _PostReviewContainerState();
}

class _PostReviewContainerState extends State<PostReviewContainer> {
  final keyForm = GlobalKey<FormState>();
  final _conReview = TextEditingController();

  int rating = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              5,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    rating = index + 1;
                  });
                },
                child: rating >= index + 1
                    ? const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 35,
                      )
                    : const Icon(
                        Icons.star_border_outlined,
                        color: Colors.orange,
                        size: 35,
                      ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Form(
            key: keyForm,
            child: TextF(
              controller: _conReview,
              maxLine: null,
              minLine: 3,
            ),
          ),
        ),
        BlocBuilder<PostReviewCubit, PostReviewState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Unggah Foto',
                      style: textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      Strings.of(context)!.optional,
                      style: textTheme.bodySmall,
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                      onPressed: () {
                        context.read<PostReviewCubit>().pickFiles();
                      },
                      icon: const Icon(Icons.add_photo_alternate),
                    ),
                  ],
                ),
                if (context.read<PostReviewCubit>().files.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: Dimens.space8),
                    padding: EdgeInsets.all(Dimens.space8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Theme.of(context).hintColor.withOpacity(0.3),
                    ),
                    child: StaggeredGrid.count(
                      crossAxisCount:
                          context.read<PostReviewCubit>().files.length > 2
                              ? 2
                              : context.read<PostReviewCubit>().files.length,
                      crossAxisSpacing: Dimens.space8,
                      mainAxisSpacing: Dimens.space8,
                      children: List.generate(
                        context.read<PostReviewCubit>().files.length,
                        (index) => StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          child: Stack(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(20.r),
                                onTap: () {
                                  showAdaptiveDialog(
                                    context: context,
                                    builder: (_) => ImageDialog(
                                      image: context
                                          .read<PostReviewCubit>()
                                          .files[index],
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: SizedBox(
                                    child: Image.file(
                                      context
                                          .read<PostReviewCubit>()
                                          .files[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<PostReviewCubit>()
                                      .removeFiles(index);
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: rating == 0
                    ? null
                    : () {
                        if (rating == 0) {
                          'rating harus diisi'.toToastError(context);
                        } else {
                          context.read<OrderCubit>().review(
                                PostReviewParams(
                                  order: widget.order,
                                  review: Review(
                                    clientUid: widget.order.clientUid,
                                    dateTime: DateTime.now(),
                                    rating: rating,
                                    review: _conReview.text,
                                  ),
                                  technician: context
                                      .read<TechnicianCubit>()
                                      .technicians
                                      .firstWhere(
                                        (element) =>
                                            element.uid ==
                                            widget.order.technicianUid,
                                      ),
                                  files: context.read<PostReviewCubit>().files,
                                ),
                              );
                        }
                      },
                child: const Text('Kirim ulasan'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
