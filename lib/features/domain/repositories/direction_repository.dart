import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class DirectionRepository {
  Future<Either<Failure, Direction>> getDirection(DirectionParams params);
}
