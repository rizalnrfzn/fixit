import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../../utils/utils.dart';
import '../../features.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;

  const AuthRepositoryImpl(this.authRemoteDatasource, this.mainBoxMixin);

  @override
  Future<Either<Failure, AuthUser>> login(LoginParams loginParams) async {
    final response = await authRemoteDatasource.login(loginParams);

    return response.fold(
      (l) => Left(l),
      (r) {
        mainBoxMixin.addData(MainBoxKeys.isOnboardPassed, true);
        mainBoxMixin.addData(MainBoxKeys.authUserId, r.uid);
        mainBoxMixin.addData(MainBoxKeys.isLogin, true);
        mainBoxMixin.addData(MainBoxKeys.isRegistered, r.isRegistered);

        return Right(r.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, AuthUser>> registerData(
      RegisterDataParams params) async {
    final response = await authRemoteDatasource.registerData(params);

    return response.fold(
      (l) => Left(l),
      (r) {
        return Right(r.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, AuthUser>> editProfile(
      EditProfileParams params) async {
    final response = await authRemoteDatasource.editProfile(params);

    return response.fold(
      (l) => Left(l),
      (r) {
        return Right(r.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, AuthUser>> register(RegisterParams params) async {
    final response = await authRemoteDatasource.register(params);

    return response.fold(
      (l) => Left(l),
      (r) {
        mainBoxMixin.addData(MainBoxKeys.isRegistered, true);
        return Right(r.toEntity());
      },
    );
  }

  @override
  Stream<AuthUser> streamUser(String uid) async* {
    try {
      yield* authRemoteDatasource.streamAuthUser(uid).map(
            (event) => event.toEntity(),
          );
    } catch (e) {
      yield* Stream.error(e);
    }
  }
}
