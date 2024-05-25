part of 'technician_detail_cubit.dart';

@freezed
class TechnicianDetailState with _$TechnicianDetailState {
  const factory TechnicianDetailState.loading() = _Loading;
  const factory TechnicianDetailState.failure(String message) = _Failure;
  const factory TechnicianDetailState.reviewStream(List<Review> reviews) =
      _ReviewStream;
}
