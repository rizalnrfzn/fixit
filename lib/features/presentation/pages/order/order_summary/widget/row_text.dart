import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    required this.left,
    required this.right,
  });

  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            left,
            style: textTheme.bodyMedium,
          ),
          SpacerH(
            value: Dimens.space24,
          ),
          Expanded(
            child: Text(
              right,
              style:
                  textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              maxLines: 3,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
