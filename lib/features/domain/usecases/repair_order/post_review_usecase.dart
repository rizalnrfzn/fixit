import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

class PostReviewUsecase extends UseCase<RepairOrder, PostReviewParams> {
  final RepairOrderRepository _repository;

  PostReviewUsecase(this._repository);

  @override
  Future<Either<Failure, RepairOrder>> call(PostReviewParams params) =>
      _repository.review(params);
}

class PostReviewParams {
  final RepairOrder order;
  final Review review;
  final Technician technician;
  final List<File> files;

  PostReviewParams({
    required this.order,
    required this.review,
    required this.technician,
    required this.files,
  });
}
