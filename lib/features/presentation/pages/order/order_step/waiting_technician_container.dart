import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

class WaitingTechnicianContainer extends StatelessWidget {
  const WaitingTechnicianContainer({
    super.key,
    required this.repairOrder,
    required this.direction,
    required this.mapHeight,
  });

  final RepairOrder repairOrder;
  final Direction direction;
  final double mapHeight;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    MapController mapController = MapController();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Strings.of(context)!.distance,
              style: textTheme.bodyMedium,
            ),
            SpacerH(
              value: Dimens.space24,
            ),
            Expanded(
              child: Text(
                '${toKiloMeter(direction.routes![0].distance!)} km',
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
              Strings.of(context)!.estimatedTime,
              style: textTheme.bodyMedium,
            ),
            SpacerH(
              value: Dimens.space24,
            ),
            Expanded(
              child: Text(
                '${toMinute(direction.routes![0].duration!)} menit',
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                maxLines: 3,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        SpacerV(value: Dimens.space12),
        SizedBox(
          height: mapHeight,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    minZoom: 13,
                    maxZoom: 18,
                    initialZoom: 15,
                    initialCenter: context
                        .read<TechnicianCubit>()
                        .technicians
                        .firstWhere((element) =>
                            element.uid == repairOrder.technicianUid)
                        .currentLocation!,
                    keepAlive: true,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/levelsekawan/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}',
                      additionalOptions: const {
                        'mapStyleId': ListAPI.streetStyle,
                        'accessToken': ListAPI.mapBoxAccessToken,
                      },
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: direction.routes![0].geometry!.coordinates!,
                          strokeWidth: 5,
                          color: colorTheme.blue!,
                        ),
                      ],
                    ),
                    BlocBuilder<TechnicianCubit, TechnicianState>(
                      builder: (_, __) {
                        return MarkerLayer(
                          markers: [
                            Marker(
                              point: repairOrder.clientLocation!,
                              child: ProfilePicture(
                                pictureUrl: context
                                    .read<AuthCubit>()
                                    .authUser!
                                    .profilePicture!,
                                onTap: () {},
                                radius: Dimens.space12,
                                border: Dimens.space2,
                              ),
                            ),
                            Marker(
                              point: context
                                  .read<TechnicianCubit>()
                                  .technicians
                                  .firstWhere((element) =>
                                      element.uid == repairOrder.technicianUid)
                                  .currentLocation!,
                              child: ProfilePicture(
                                pictureUrl: context
                                    .read<TechnicianCubit>()
                                    .technicians
                                    .firstWhere((element) =>
                                        element.uid ==
                                        repairOrder.technicianUid)
                                    .profilePicture!,
                                onTap: () {},
                                radius: Dimens.space12,
                                border: Dimens.space2,
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
