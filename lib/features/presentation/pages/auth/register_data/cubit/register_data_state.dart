part of 'register_data_cubit.dart';

@freezed
class RegisterDataState with _$RegisterDataState {
  const factory RegisterDataState.initial() = _Initial;
  const factory RegisterDataState.profilePicture(File picture) =
      _ProfilePicture;
}
