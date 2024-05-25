import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../features.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthUser>> login(LoginParams params);

  Future<Either<Failure, AuthUser>> register(RegisterParams params);

  Future<Either<Failure, AuthUser>> registerData(RegisterDataParams params);

  Future<Either<Failure, AuthUser>> editProfile(EditProfileParams params);

  Stream<AuthUser> streamUser(String uid);
}
