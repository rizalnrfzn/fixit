import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:latlong2/latlong.dart';

class ChangeLocationUsecase extends UseCase<Geolocation, ChangeLocationParams> {
  final GeolocationRepository _repository;

  ChangeLocationUsecase(this._repository);

  @override
  Future<Either<Failure, Geolocation>> call(ChangeLocationParams params) =>
      _repository.changeLocation(params);
}

class ChangeLocationParams {
  final LatLng location;

  ChangeLocationParams({required this.location});
}
