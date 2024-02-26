import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SpecialOffersContainer extends StatefulWidget {
  const SpecialOffersContainer({
    super.key,
  });

  @override
  State<SpecialOffersContainer> createState() => _SpecialOffersContainerState();
}

class _SpecialOffersContainerState extends State<SpecialOffersContainer> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.space24),
          child: Row(
            children: [
              Text(
                Strings.of(context)!.specialOffers,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              ButtonText(
                title: Strings.of(context)!.seeAll,
                onPressed: () {
                  context.push(Routes.specialOffers.path);
                },
              )
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 200.w,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: PageView.builder(
                itemCount: 5,
                pageSnapping: true,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: Dimens.space24),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Image.asset(Images.test, fit: BoxFit.cover)),
                ),
              ),
            ),
            Positioned(
              top: 180.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: Dimens.space6),
                    child: Container(
                      height: Dimens.space8,
                      width:
                          index == pageIndex ? Dimens.space30 : Dimens.space8,
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).extension<MyAppColors>()!.shadow,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
