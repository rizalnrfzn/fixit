import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class RepairOrderRepository {
  Stream<List<RepairOrder>> streamOrders(String uid);

  Future<Either<Failure, RepairOrder>> postOrder(PostOrderParams params);

  Future<Either<Failure, RepairOrder>> acceptRepair(RepairOrder params);

  Future<Either<Failure, RepairOrder>> rejectRepair(RepairOrder params);

  Future<Either<Failure, RepairOrder>> paymentOrder(RepairOrder params);

  Future<Either<Failure, RepairOrder>> review(PostReviewParams params);

  Future<Either<Failure, RepairOrder>> cancelOrder(RepairOrder params);
}
