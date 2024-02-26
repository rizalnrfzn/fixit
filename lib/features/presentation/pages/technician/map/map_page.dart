import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapController mapController;

  @override
  void initState() {
    mapController = MapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                minZoom: 13,
                maxZoom: 20,
                initialCenter:
                    context.read<TechnicianCubit>().geolocation!.location!,
                initialZoom: 13,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
