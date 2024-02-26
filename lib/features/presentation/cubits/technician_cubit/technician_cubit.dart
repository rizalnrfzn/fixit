import 'dart:async';

import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'technician_state.dart';
part 'technician_cubit.freezed.dart';

class TechnicianCubit extends Cubit<TechnicianState> {
  TechnicianCubit(
    this._streamTechnicians,
    this._getLocation,
    this._getDirection,
  ) : super(const TechnicianState.loading());

  final StreamTechniciansUsecase _streamTechnicians;
  final GetLocationUsecase _getLocation;
  final GetDirectionUsecase _getDirection;

  StreamSubscription? _technicianSubscription;
  List<Technician> technicians = [];
  Geolocation? geolocation;

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

  Future<Direction?> getDirection({
    required LatLng location,
    required LatLng destinationLocation,
  }) async {
    final data = await _getDirection.call(
      DirectionParams(location, destinationLocation),
    );

    return data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message!));
        }
        return null;
      },
      (r) {
        return r;
      },
    );
  }

  void streamTechnicians() async {
    emit(const _Loading());
    technicians = [];
    await getLocation();
    _technicianSubscription?.cancel();
    _technicianSubscription = _streamTechnicians.call().listen(
      (event) async {
        List<Technician> technicianNew = [];
        List<Technician> techniciansOld = technicians;
        for (var data in event) {
          if (techniciansOld.any((element) => element.uid == data.uid)) {
            final technicianOld =
                techniciansOld.firstWhere((element) => element.uid == data.uid);
            technicianNew
                .add(data.copyWith(direction: technicianOld.direction));
          } else {
            final direction = await getDirection(
              location: geolocation!.location!,
              destinationLocation: data.location!,
            );
            technicianNew.add(data.copyWith(direction: direction));
          }
        }
        technicians = technicianNew;
        emit(_StreamTechnicians(technicianNew, geolocation!));
      },
    );
  }

  @override
  Future<void> close() {
    _technicianSubscription?.cancel();
    return super.close();
  }
}
