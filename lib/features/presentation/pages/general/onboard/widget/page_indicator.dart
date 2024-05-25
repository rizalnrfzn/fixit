import 'package:fixit/core/core.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.space8,
      width: isActive ? Dimens.space30 : Dimens.space8,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).extension<MyAppColors>()!.blue
            : Theme.of(context).extension<MyAppColors>()!.shadow,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
