import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OrderDoneListTile extends StatelessWidget {
  const OrderDoneListTile({super.key, required this.repairOrder});

  final RepairOrder repairOrder;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.space12),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context)
              .extension<MyAppColors>()!
              .card!
              .withOpacity(0.5),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                context.push(Routes.orderDetail.path, extra: repairOrder.id);
              },
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30.r),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimens.space20,
                      vertical: Dimens.space16,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: Container(
                        height: 117.w,
                        width: 117.w,
                        color: Theme.of(context).hintColor.withOpacity(0.3),
                        child: CachedNetworkImage(
                          imageUrl: context
                              .read<TechnicianCubit>()
                              .technicians
                              .firstWhere((element) =>
                                  element.uid == repairOrder.technicianUid)
                              .profilePicture!,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 117.w,
                    width: 191.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context
                              .read<TechnicianCubit>()
                              .technicians
                              .firstWhere((element) =>
                                  element.uid == repairOrder.technicianUid)
                              .name!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const Spacer(flex: 1),
                        Text(
                          Strings.of(context)!.electronicRepair,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        BlocBuilder<ElectronicCubit, ElectronicState>(
                          builder: (context, state) {
                            return Text(
                              context
                                  .read<ElectronicCubit>()
                                  .electronics
                                  .firstWhere((element) =>
                                      element.id == repairOrder.electronicId)
                                  .name!,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyMedium,
                            );
                          },
                        ),
                        const Spacer(flex: 2),
                        Container(
                          decoration: BoxDecoration(
                            color: colorTheme.green,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimens.space8,
                              vertical: Dimens.space4,
                            ),
                            child: Text(
                              repairOrder.status!,
                              style: textTheme.bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
