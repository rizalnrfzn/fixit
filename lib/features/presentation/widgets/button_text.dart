import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;

  const ButtonText({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).extension<MyAppColors>()!.blue,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).extension<MyAppColors>()!.blue),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
