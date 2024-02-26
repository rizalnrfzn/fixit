part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.success(
      Geolocation geolocation, Direction direction) = _Success;
  const factory LocationState.failure(String message) = _Failure;
}
