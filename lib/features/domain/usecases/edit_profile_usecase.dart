import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

class EditProfileUsecase extends UseCase<AuthUser, EditProfileParams> {
  final AuthRepository _repository;

  EditProfileUsecase(this._repository);

  @override
  Future<Either<Failure, AuthUser>> call(EditProfileParams params) =>
      _repository.editProfile(params);
}

class EditProfileParams {
  final String name;
  final String phoneNumber;
  final String profilePicture;
  File? newProfilePicture;

  EditProfileParams({
    required this.name,
    required this.phoneNumber,
    required this.profilePicture,
    this.newProfilePicture,
  });
}
