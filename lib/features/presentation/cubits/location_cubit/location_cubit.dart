import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(
    this._getLocation,
    this._getDirection,
    this._changeLocation,
  ) : super(const LocationState.initial());

  final GetLocationUsecase _getLocation;
  final GetDirectionUsecase _getDirection;
  final ChangeLocationUsecase _changeLocation;

  Geolocation? geolocation;
  Direction? direction;

  Future<Geolocation?> getLocation() async {
    final data = await _getLocation.call(NoParams());

    data.fold(
      (l) {
        if (l is LocationError) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        geolocation = r;
        return r;
      },
    );
    return null;
  }

  Future<Geolocation?> changeLocation(LatLng location) async {
    final data =
        await _changeLocation.call(ChangeLocationParams(location: location));

    data.fold(
      (l) {
        if (l is LocationError) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        geolocation = r;
        return r;
      },
    );
    return null;
  }

  Future<void> getDirection(LatLng destinationLocation) async {
    await getLocation();

    final data = await _getDirection
        .call(DirectionParams(geolocation!.location!, destinationLocation));

    data.fold(
      (l) {
        emit(_Failure(l.toString()));
      },
      (r) {
        direction = r;
        emit(_Success(geolocation!, direction!));
      },
    );
  }

  Future<void> changeDirection(
      LatLng location, LatLng destinationLocation) async {
    await changeLocation(location);

    final data = await _getDirection
        .call(DirectionParams(geolocation!.location!, destinationLocation));

    data.fold(
      (l) {
        emit(_Failure(l.toString()));
      },
      (r) {
        direction = r;
        emit(_Success(geolocation!, direction!));
      },
    );
  }
}
