import 'package:dartz/dartz.dart';
import 'package:fixit/core/error/failure.dart';
import 'package:fixit/features/features.dart';

class RepairOrderRepositoryImpl implements RepairOrderRepository {
  final RepairOrderRemoteDatasource _datasource;

  RepairOrderRepositoryImpl(this._datasource);

  @override
  Stream<List<RepairOrder>> streamOrders(String uid) async* {
    try {
      yield* _datasource.streamRepairOrders(uid).map(
            (event) => event
                .map(
                  (e) => e.toEntity(),
                )
                .toList(),
          );
    } catch (e) {
      yield* Stream.error(e);
    }
  }

  @override
  Future<Either<Failure, RepairOrder>> postOrder(PostOrderParams params) async {
    final response = await _datasource.postOrder(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }
}
