import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DetailTab extends StatelessWidget {
  const DetailTab({super.key, required this.order});

  final RepairOrder order;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      .firstWhere((element) => element.id == order.electronicId)
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
                  left: 'Date Time',
                  right: toDateTime(order.dateTime!),
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
                  right:
                      '${toMinute(order.duration!)} ${Strings.of(context)!.minutes}',
                ),
                RowText(
                  left: Strings.of(context)!.checkingCost,
                  right: 'Rp${toThousand(order.checkingCost!)}',
                ),
              ],
            ),
          ),
          GripeContainer(gripe: order.gripe!),
          if (order.electronicPicture != null &&
              order.electronicPicture!.isNotEmpty)
            Container(
              margin: EdgeInsets.all(Dimens.space16),
              padding: EdgeInsets.all(Dimens.space8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Theme.of(context).hintColor.withOpacity(0.3),
              ),
              child: StaggeredGrid.count(
                crossAxisCount: order.electronicPicture!.length > 2
                    ? 2
                    : order.electronicPicture!.length,
                crossAxisSpacing: Dimens.space8,
                mainAxisSpacing: Dimens.space8,
                children: List.generate(
                  order.electronicPicture!.length,
                  (index) => StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: Stack(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(20.r),
                          onTap: () {
                            showAdaptiveDialog(
                              context: context,
                              builder: (_) => NetworkImageDialog(
                                image: order.electronicPicture![index],
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: SizedBox(
                              child: CachedNetworkImage(
                                imageUrl: order.electronicPicture![index],
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
    );
  }
}
