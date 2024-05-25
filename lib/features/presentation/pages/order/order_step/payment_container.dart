import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/converter/converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({super.key, required this.order});

  final RepairOrder order;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    void payment() {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Konfirmasi pembayaran',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          content: Text(
            'Pastikan Anda sudah melakukan pembayaran.',
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
                context.read<OrderCubit>().paymentOrder(order);
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

    return Column(
      children: [
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FilledButton(
                onPressed: payment,
                style: FilledButton.styleFrom(
                  foregroundColor: Palette.background,
                  minimumSize: Size(300.w, 40.w),
                ),
                child: const Text('Konfirmasi pembayaran'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
