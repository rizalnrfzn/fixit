import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.space24,
        vertical: Dimens.space8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfilePicture(
                pictureUrl: review.clientPicture!,
                onTap: () {},
                radius: Dimens.space24,
                border: Dimens.space2,
              ),
              SizedBox(width: Dimens.space8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${review.clientName}',
                    style: textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    review.dateTime.toString(),
                    style: textTheme.labelSmall,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(width: 1, color: colorTheme.blue!),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.space12,
                    vertical: Dimens.space6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        size: Dimens.space16,
                      ),
                      SizedBox(width: Dimens.space4),
                      Text(
                        '${review.rating}',
                        style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorTheme.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Dimens.space4),
          Text('${review.review}'),
        ],
      ),
    );
  }
}
