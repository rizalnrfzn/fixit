part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.failure(String message) = _Failure;
  const factory OrderState.success(List<RepairOrder> orders) = _Success;
  const factory OrderState.stream(List<RepairOrder> orders) = _Stream;
}
