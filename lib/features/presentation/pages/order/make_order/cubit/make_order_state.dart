part of 'make_order_cubit.dart';

@freezed
class MakeOrderState with _$MakeOrderState {
  const factory MakeOrderState.initial() = _Initial;
  const factory MakeOrderState.step(int index) = _Step;
  const factory MakeOrderState.failure(String message) = _Failure;
  const factory MakeOrderState.selectElectronic(String id) =
      _SelectedElectronic;
  const factory MakeOrderState.gripes(List<String> gripes) = _Gripes;
  const factory MakeOrderState.location(Geolocation geolocation) = _Location;
  const factory MakeOrderState.direction(Direction direction) = _Direction;
  const factory MakeOrderState.files(List<File> files) = _Files;
}
