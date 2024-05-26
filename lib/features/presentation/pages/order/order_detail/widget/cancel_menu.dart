import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CancelMenu extends StatelessWidget {
  const CancelMenu({super.key, required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final keyForm = GlobalKey<FormState>();
    final conReason = TextEditingController();

    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert),
          tooltip: 'Show menu',
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: () {
            final order = context.read<OrderCubit>().orders.firstWhere(
                  (element) => element.id == orderId,
                );
            if (order.status == Status.konfirmasiTeknisi.name ||
                order.status == Status.menungguTeknisi.name) {
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
                            'Pembatalan pesanan',
                            style: textTheme.bodyLarge,
                          )
                        ]),
                        SpacerV(value: Dimens.space16),
                        const Text('Masukkan alasan pembatalan pesanan ini'),
                        Form(
                          key: keyForm,
                          child: TextF(
                            controller: conReason,
                            maxLine: null,
                            minLine: 3,
                            validator: (String? value) =>
                                value == null || value.isEmpty
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .extension<MyAppColors>()!
                                          .subtitle,
                                    ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (keyForm.currentState?.validate() ?? false) {
                                  final params = order.copyWith(
                                      reasonCancelled: conReason.text);
                                  context
                                      .read<OrderCubit>()
                                      .cancelOrder(params);
                                  context.pop();
                                }
                              },
                              child: Text(
                                Strings.of(context)!.yes,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
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
            } else {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  title: const Text('Tidak dapat dibatalkan'),
                  content: const SingleChildScrollView(
                    child: ListBody(
                      children: [
                        Text('Pesanan ini tidak dapat dibatalkan'),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('oke'),
                    ),
                  ],
                ),
              );
            }
          },
          child: const Text('Batalkan pesanan'),
        ),
      ],
    );
  }
}
