import 'package:fixit/features/features.dart';
import 'package:fixit/utils/ext/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
