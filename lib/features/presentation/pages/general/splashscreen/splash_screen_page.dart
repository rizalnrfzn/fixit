import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.goNamed(Routes.onboard.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: ColoredBox(
        color: Theme.of(context).extension<MyAppColors>()!.background!,
        child: Center(
          child: Image.asset(Images.icLogo,
              width: 350.w,
              color: Theme.of(context).extension<MyAppColors>()!.blue),
        ),
      ),
    );
  }
}
