part of 'order_summary_cubit.dart';

@freezed
class OrderSummaryState with _$OrderSummaryState {
  const factory OrderSummaryState.initial() = _Initial;
  const factory OrderSummaryState.loading() = _Loading;
  const factory OrderSummaryState.failure(String message) = _Failure;
  const factory OrderSummaryState.success(RepairOrder order) = _Success;
}
