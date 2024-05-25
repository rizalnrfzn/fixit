import 'package:flutter/material.dart';

import '../../../core/core.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;

  const Button({
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
    return FilledButton(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.all(Dimens.space16),
        minimumSize: Size.fromHeight(Dimens.space36),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.circular50),
        ),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
