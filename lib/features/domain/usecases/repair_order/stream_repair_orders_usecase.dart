import 'package:fixit/features/features.dart';

class StreamRepairOrdersUsecase {
  final RepairOrderRepository _repository;

  StreamRepairOrdersUsecase(this._repository);

  Stream<List<RepairOrder>> call(String uid) => _repository.streamOrders(uid);
}
