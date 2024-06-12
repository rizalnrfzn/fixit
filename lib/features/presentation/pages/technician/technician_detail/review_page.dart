import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int selectedStar = 0;
  List<Review> listReview = [];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;

    return Parent(
      appBar: MyAppBar(context, title: Strings.of(context)!.review).call(),
      child: BlocBuilder<TechnicianDetailCubit, TechnicianDetailState>(
        builder: (_, state) {
          return state.when(
            loading: () => const Center(child: Loading()),
            failure: (message) => Center(child: Empty(errorMessage: message)),
            reviewStream: (reviews) {
              List<Review> sortedReview = [];
              sortedReview.addAll(reviews);
              sortedReview.sort(
                (a, b) => a.dateTime!.compareTo(b.dateTime!),
              );
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
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
                                  right: index == 5
                                      ? Dimens.space24
                                      : Dimens.space8,
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
                                      listReview = sortedReview
                                          .where((element) =>
                                              element.rating == index)
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
                          ? sortedReview.isEmpty
                              ? SizedBox(
                                  height: 100,
                                  child: Center(
                                    child:
                                        Text(Strings.of(context)!.noReviewsYet),
                                  ),
                                )
                              : Column(
                                  children: List.generate(
                                    sortedReview.length,
                                    (index) =>
                                        ReviewTile(review: sortedReview[index]),
                                  ),
                                )
                          : listReview.isEmpty
                              ? SizedBox(
                                  height: 100,
                                  child: Center(
                                    child:
                                        Text(Strings.of(context)!.noReviewsYet),
                                  ),
                                )
                              : Column(
                                  children: List.generate(
                                    listReview.length,
                                    (index) =>
                                        ReviewTile(review: listReview[index]),
                                  ),
                                ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
