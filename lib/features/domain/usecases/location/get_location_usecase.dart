import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

class GetLocationUsecase extends UseCase<Geolocation, NoParams> {
  final GeolocationRepository _repository;

  GetLocationUsecase(this._repository);

  @override
  Future<Either<Failure, Geolocation>> call(NoParams params) =>
      _repository.getLocation();
}
