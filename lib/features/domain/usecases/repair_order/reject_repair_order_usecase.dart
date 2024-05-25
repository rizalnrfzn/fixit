import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

class RejectRepairOrderUsecase extends UseCase<RepairOrder, RepairOrder> {
  final RepairOrderRepository _repository;

  RejectRepairOrderUsecase(this._repository);

  @override
  Future<Either<Failure, RepairOrder>> call(RepairOrder params) =>
      _repository.rejectRepair(params);
}
