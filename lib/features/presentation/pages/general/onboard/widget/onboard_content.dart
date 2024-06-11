import 'package:fixit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.images,
    required this.text,
  });

  final String images;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: EdgeInsets.all(Dimens.space24),
          child: Image.asset(
            images,
            height: 400.h,
            color: Theme.of(context).extension<MyAppColors>()!.blue,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.space24,
            vertical: Dimens.space46,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
