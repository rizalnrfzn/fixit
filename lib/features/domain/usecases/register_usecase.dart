import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

class RegisterUsecase extends UseCase<AuthUser, RegisterParams> {
  final AuthRepository _repository;

  RegisterUsecase(this._repository);

  @override
  Future<Either<Failure, AuthUser>> call(RegisterParams params) =>
      _repository.register(params);
}

class RegisterParams {
  final String email;
  final String password;

  RegisterParams({
    required this.email,
    required this.password,
  });
}
