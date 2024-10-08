import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewContainer extends StatefulWidget {
  const ReviewContainer({super.key});

  @override
  State<ReviewContainer> createState() => _ReviewContainerState();
}

class _ReviewContainerState extends State<ReviewContainer> {
  int selectedStar = 0;
  List<Review> listReview = [];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;

    return BlocBuilder<TechnicianDetailCubit, TechnicianDetailState>(
      builder: (_, state) {
        return state.when(
          loading: () => const Center(child: Loading()),
          failure: (message) => Center(child: Empty(errorMessage: message)),
          reviewStream: (reviews) {
            return Column(
              children: [
                SizedBox(
                  height: Dimens.space40,
                  width: 428.w,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      6,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                            right: index == 5 ? Dimens.space24 : Dimens.space8,
                            left: index == 0 ? Dimens.space24 : 0),
                        child: FilterChip(
                          showCheckmark: false,
                          selectedColor: colorTheme.blue,
                          side: BorderSide(color: colorTheme.blue!),
                          selected: selectedStar == index,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: selectedStar == index
                                    ? Palette.background
                                    : colorTheme.blue,
                                size: Dimens.space20,
                              ),
                              SizedBox(width: Dimens.space8),
                              Text(
                                index == 0
                                    ? Strings.of(context)!.all
                                    : index.toString(),
                                style: textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: selectedStar == index
                                      ? Palette.background
                                      : colorTheme.blue,
                                ),
                              ),
                            ],
                          ),
                          onSelected: (value) {
                            setState(() {
                              selectedStar = index;
                              if (selectedStar != 0) {
                                listReview = reviews
                                    .where((element) => element.rating == index)
                                    .toList();
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SpacerV(value: Dimens.space8),
                selectedStar == 0
                    ? reviews.isEmpty
                        ? SizedBox(
                            height: 100,
                            child: Center(
                              child: Text(Strings.of(context)!.noReviewsYet),
                            ),
                          )
                        : Column(
                            children: List.generate(
                              reviews.length > 5 ? 5 : reviews.length,
                              (index) => ReviewTile(review: reviews[index]),
                            ),
                          )
                    : listReview.isEmpty
                        ? SizedBox(
                            height: 100,
                            child: Center(
                              child: Text(Strings.of(context)!.noReviewsYet),
                            ),
                          )
                        : Column(
                            children: List.generate(
                              listReview.length > 5 ? 5 : listReview.length,
                              (index) => ReviewTile(review: listReview[index]),
                            ),
                          ),
              ],
            );
          },
        );
      },
    );
  }
}
