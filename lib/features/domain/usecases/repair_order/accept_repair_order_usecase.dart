import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

class AcceptRepairOrderUsecase extends UseCase<RepairOrder, RepairOrder> {
  final RepairOrderRepository _repository;

  AcceptRepairOrderUsecase(this._repository);

  @override
  Future<Either<Failure, RepairOrder>> call(RepairOrder params) =>
      _repository.acceptRepair(params);
}
