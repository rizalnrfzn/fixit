part of 'technician_cubit.dart';

@freezed
class TechnicianState with _$TechnicianState {
  const factory TechnicianState.loading() = _Loading;

  const factory TechnicianState.failure(String message) = _Failure;
  const factory TechnicianState.streamTechnicians(
          List<Technician> technicians, Geolocation geolocation) =
      _StreamTechnicians;
}
