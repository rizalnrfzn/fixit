import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapController mapController;
  bool showTile = false;
  late Technician showTeknisi;
  List<LatLng> routes = [];
  late LatLng location;

  @override
  void initState() {
    mapController = MapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;

    return Parent(
      child: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<TechnicianCubit, TechnicianState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const Center(child: Loading()),
                  failure: (message) => Empty(errorMessage: message),
                  streamTechnicians: (technicians, geolocation) {
                    location = geolocation.location!;

                    List<Marker> listAllMarker = [
                      Marker(
                        point: location,
                        child: Icon(
                          Icons.my_location,
                          color: colorTheme.blue,
                        ),
                      ),
                    ];

                    for (var technician in technicians) {
                      listAllMarker.add(
                        Marker(
                          point: technician.location!,
                          child: ProfilePicture(
                            pictureUrl: technician.profilePicture!,
                            radius: 14.w,
                            onTap: () {
                              routes.clear();
                              setState(
                                () {
                                  routes.clear();
                                  showTeknisi = technician;
                                  if (showTile == false) {
                                    showTile = !showTile;
                                  }
                                  for (var route in technician.direction!
                                      .routes![0].geometry!.coordinates!) {
                                    routes.add(route);
                                  }
                                  mapController.move(technician.location!, 17);
                                },
                              );
                            },
                          ),
                        ),
                      );
                    }

                    return FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                          minZoom: 13,
                          maxZoom: 20,
                          initialCenter: location,
                          initialZoom: 13,
                          keepAlive: true,
                          onTap: (tapPosition, point) {
                            routes.clear();
                            if (showTile) {
                              setState(() {
                                showTile = !showTile;
                              });
                            }
                          }),
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
                              points: routes,
                              strokeWidth: 5,
                              color: colorTheme.blue!,
                            )
                          ],
                        ),
                        MarkerLayer(markers: listAllMarker),
                      ],
                    );
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.outline),
                      borderRadius: BorderRadius.circular(10.0),
                      color: colorTheme.card,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.gps_fixed_outlined,
                        color: colorTheme.blue,
                      ),
                      onPressed: () {
                        mapController.move(location, 13);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: BlocBuilder<TechnicianCubit, TechnicianState>(
                      builder: (context, state) {
                        return SearchBox(
                          allTeknisi:
                              context.read<TechnicianCubit>().technicians,
                          dashboard: false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (showTile)
              Positioned(
                left: 16,
                right: 16,
                bottom: 0,
                child: TechnicianListTile(technician: showTeknisi),
              ),
          ],
        ),
      ),
    );
  }
}
