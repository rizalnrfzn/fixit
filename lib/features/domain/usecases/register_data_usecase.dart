import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

class RegisterDataUsecase extends UseCase<AuthUser, RegisterDataParams> {
  final AuthRepository _repository;

  RegisterDataUsecase(this._repository);

  @override
  Future<Either<Failure, AuthUser>> call(RegisterDataParams params) =>
      _repository.registerData(params);
}

class RegisterDataParams {
  final String name;
  final String phoneNumber;
  final File? profilePicture;

  RegisterDataParams({
    required this.name,
    required this.phoneNumber,
    this.profilePicture,
  });
}
