import 'dart:io';

import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key, required this.order, required this.files});

  final RepairOrder order;
  final List<File> files;

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar:
          MyAppBar(context, title: Strings.of(context)!.orderSummary).call(),
      bottomNavigation: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Theme.of(context).hintColor),
            left: BorderSide(color: Theme.of(context).hintColor),
            right: BorderSide(color: Theme.of(context).hintColor),
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.w),
          ),
        ),
        child: BlocListener<OrderSummaryCubit, OrderSummaryState>(
          listener: (context, state) {
            state.whenOrNull(
              loading: () => context.show(),
              failure: (message) {
                context.dismiss();
                message.toToastError(context);
              },
              success: (order) {
                context.dismiss();
                'Berhasil memesan'.toToastSuccess(context);

                context.pop();
                context.pop();
                context.push(Routes.orderDetail.path, extra: order.id);
              },
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimens.space20, horizontal: Dimens.space8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                  onPressed: () {
                    context.read<OrderSummaryCubit>().postOrder(
                          PostOrderParams(
                            order: order,
                            files: files,
                          ),
                        );
                  },
                  style: FilledButton.styleFrom(
                    foregroundColor:
                        Theme.of(context).extension<MyAppColors>()!.buttonText,
                    minimumSize: Size(380.w, 50.w),
                  ),
                  child: Text(Strings.of(context)!.orderNow),
                ),
              ],
            ),
          ),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(Dimens.space16),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.space24,
                  vertical: Dimens.space12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Theme.of(context).hintColor.withOpacity(0.3),
                ),
                child: Column(
                  children: [
                    RowText(
                      left: Strings.of(context)!.service,
                      right: Strings.of(context)!.electronicRepair,
                    ),
                    RowText(
                      left: Strings.of(context)!.electronics,
                      right: context
                          .read<ElectronicCubit>()
                          .electronics
                          .firstWhere(
                              (element) => element.id == order.electronicId)
                          .name!,
                    ),
                    RowText(
                      left: Strings.of(context)!.technician,
                      right: context
                          .read<TechnicianCubit>()
                          .technicians
                          .firstWhere(
                              (element) => element.uid == order.technicianUid)
                          .name!,
                    ),
                    RowText(
                      left: Strings.of(context)!.technicianLocation,
                      right: context
                          .read<TechnicianCubit>()
                          .technicians
                          .firstWhere(
                              (element) => element.uid == order.technicianUid)
                          .address!,
                    ),
                    RowText(
                      left: Strings.of(context)!.myLocation,
                      right: order.clientAddress!,
                    ),
                    RowText(
                      left: Strings.of(context)!.distance,
                      right: '${toKiloMeter(order.distance!)} Km',
                    ),
                    RowText(
                      left: Strings.of(context)!.estimatedTime,
                      right: '${toMinute(order.duration!)} menit',
                    ),
                    RowText(
                      left: Strings.of(context)!.checkingCost,
                      right: 'Rp${toThousand(order.checkingCost!)}',
                    ),
                  ],
                ),
              ),
              GripeContainer(gripe: order.gripe!),
              if (files.isNotEmpty)
                Container(
                  margin: EdgeInsets.all(Dimens.space16),
                  padding: EdgeInsets.all(Dimens.space8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Theme.of(context).hintColor.withOpacity(0.3),
                  ),
                  child: StaggeredGrid.count(
                    crossAxisCount: files.length > 2 ? 2 : files.length,
                    crossAxisSpacing: Dimens.space8,
                    mainAxisSpacing: Dimens.space8,
                    children: List.generate(
                      files.length,
                      (index) => StaggeredGridTile.fit(
                        crossAxisCellCount: 1,
                        child: Stack(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(20.r),
                              onTap: () {
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (_) => ImageDialog(
                                    image: files[index],
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: SizedBox(
                                  child: Image.file(
                                    files[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
