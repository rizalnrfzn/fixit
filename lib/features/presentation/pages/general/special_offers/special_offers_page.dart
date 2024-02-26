import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialOffersPage extends StatelessWidget {
  const SpecialOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar:
          MyAppBar(context, title: Strings.of(context)!.specialOffers).call(),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Dimens.space24),
          child: Column(
            children: List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.symmetric(vertical: Dimens.space12),
                child: Container(
                  height: 200.w,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: Image.asset(Images.test, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
