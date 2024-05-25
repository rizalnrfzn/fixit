import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class GeolocationRepository {
  Future<Either<Failure, Geolocation>> getLocation();

  Future<Either<Failure, Geolocation>> changeLocation(
      ChangeLocationParams params);
}
