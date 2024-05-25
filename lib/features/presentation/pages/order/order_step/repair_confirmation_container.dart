import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RepairConfirmationContainer extends StatelessWidget {
  const RepairConfirmationContainer({super.key, required this.order});

  final RepairOrder order;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
    final TextEditingController conReason = TextEditingController();

    void accept() {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Perbaiki',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          content: Text(
            'Anda yakin ingin memperbaiki ini?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                Strings.of(context)!.cancel,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color:
                          Theme.of(context).extension<MyAppColors>()!.subtitle,
                    ),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<OrderCubit>().acceptRepair(order);
                context.pop();
              },
              child: Text(
                Strings.of(context)!.yes,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).extension<MyAppColors>()!.blue,
                    ),
              ),
            ),
          ],
        ),
      );
    }

    Future<void> reject() async {
      showDialog(
        context: context,
        builder: (_) => Dialog(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.space24,
              vertical: Dimens.space16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(children: [
                  Text(
                    'Tolak Perbaikan',
                    style: textTheme.bodyLarge,
                  )
                ]),
                SpacerV(value: Dimens.space16),
                const Text('Anda yakin ingin menolak perbaikan ini?'),
                Form(
                  key: keyForm,
                  child: TextF(
                    controller: conReason,
                    maxLine: null,
                    minLine: 3,
                    validator: (String? value) => value == null || value.isEmpty
                        ? Strings.of(context)!.errorEmptyField
                        : null,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        Strings.of(context)!.cancel,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .extension<MyAppColors>()!
                                  .subtitle,
                            ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (keyForm.currentState?.validate() ?? false) {
                          context.read<OrderCubit>().rejectRepair(order);
                          context.pop();
                        }
                      },
                      child: Text(
                        Strings.of(context)!.yes,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .extension<MyAppColors>()!
                                  .blue,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Kerusakan'),
        Column(
          children: List.generate(
            order.damage!.length,
            (index) => Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.space6,
                    vertical: Dimens.space12,
                  ),
                  child: Container(
                    width: Dimens.space8,
                    height: Dimens.space8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: textTheme.bodyLarge!.color,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Dimens.space12),
                    child: Text(order.damage![index]),
                  ),
                ),
              ],
            ),
          ),
        ),
        SpacerV(value: Dimens.space12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Strings.of(context)!.checkingCost,
              style: textTheme.bodyMedium,
            ),
            SpacerH(
              value: Dimens.space24,
            ),
            Expanded(
              child: Text(
                'Rp${toThousand(order.checkingCost!)}',
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                maxLines: 3,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Biaya Perbaikan',
              style: textTheme.bodyMedium,
            ),
            SpacerH(
              value: Dimens.space24,
            ),
            Expanded(
              child: Text(
                'Rp${toThousand(order.repairCost!)}',
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                maxLines: 3,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        const Divider(height: 2, thickness: 0.4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Biaya',
              style: textTheme.bodyMedium,
            ),
            SpacerH(
              value: Dimens.space24,
            ),
            Expanded(
              child: Text(
                'Rp${toThousand(order.totalCost!)}',
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                maxLines: 3,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        SpacerV(value: Dimens.space16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: reject,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).hintColor,
                foregroundColor: Palette.background,
                minimumSize: Size(160.w, 40.w),
              ),
              child: const Text('Tolak Perbaikan'),
            ),
            FilledButton(
              onPressed: accept,
              style: FilledButton.styleFrom(
                foregroundColor: Palette.background,
                minimumSize: Size(160.w, 40.w),
              ),
              child: const Text('Perbaiki'),
            ),
          ],
        ),
      ],
    );
  }
}
