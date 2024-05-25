part of 'order_detail_cubit.dart';

@freezed
class OrderDetailState with _$OrderDetailState {
  const factory OrderDetailState.initial() = _Initial;
  const factory OrderDetailState.success(int index, Direction? direction) =
      _Success;
  const factory OrderDetailState.failure(String message) = _Failure;
}
