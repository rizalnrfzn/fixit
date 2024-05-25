import 'package:dartz/dartz.dart';
import 'package:fixit/core/error/failure.dart';
import 'package:fixit/features/features.dart';

class DirectionRepositoryImpl implements DirectionRepository {
  final DirectionRemoteDatasource _datasource;

  DirectionRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Direction>> getDirection(
      DirectionParams params) async {
    final response = await _datasource.getDirection(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }
}
