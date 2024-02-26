part of 'order_tile_cubit.dart';

@freezed
class OrderTileState with _$OrderTileState {
  const factory OrderTileState.initial() = _Initial;
  const factory OrderTileState.success(int index, Direction? direction) =
      _Success;
  const factory OrderTileState.failure(String message) = _Failure;
}
