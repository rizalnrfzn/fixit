import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class RepairOrderRepository {
  Stream<List<RepairOrder>> streamOrders(String uid);

  Future<Either<Failure, RepairOrder>> postOrder(PostOrderParams params);
}
