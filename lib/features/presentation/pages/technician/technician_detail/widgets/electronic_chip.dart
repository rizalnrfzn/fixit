import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElectronicChip extends StatelessWidget {
  const ElectronicChip({
    super.key,
    required this.electronicId,
  });

  final String? electronicId;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;

    final electronic = context
        .read<ElectronicCubit>()
        .electronics
        .firstWhere((element) => element.id == electronicId);

    return Padding(
      padding: EdgeInsets.only(right: Dimens.space12, bottom: Dimens.space8),
      child: Container(
        height: Dimens.space40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: colorTheme.card!.withOpacity(0.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.space12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '${electronic.name}',
                  style: textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
