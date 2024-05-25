import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

class PostOrderUsecase extends UseCase<RepairOrder, PostOrderParams> {
  final RepairOrderRepository _repository;

  PostOrderUsecase(this._repository);

  @override
  Future<Either<Failure, RepairOrder>> call(PostOrderParams params) =>
      _repository.postOrder(params);
}

class PostOrderParams {
  final RepairOrder order;
  final List<File> files;

  PostOrderParams({
    required this.order,
    required this.files,
  });
}
