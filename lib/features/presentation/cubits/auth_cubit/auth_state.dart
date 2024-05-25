part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.successLogin(AuthUser? data) = _SuccessLogin;
  const factory AuthState.successRegister(AuthUser? data) = _SuccessRegister;
  const factory AuthState.successRegisterData(AuthUser? data) =
      _SuccessRegisterData;
  const factory AuthState.successEditProfile(AuthUser? data) =
      _SuccessEditProfile;
  const factory AuthState.streamUser(AuthUser? data) = _StreamUser;
  const factory AuthState.logedOut() = _LogedOut;
  const factory AuthState.failure(String message) = _Failure;
  const factory AuthState.init() = _Init;
}
