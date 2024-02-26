import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'order_tile_state.dart';
part 'order_tile_cubit.freezed.dart';

class OrderTileCubit extends Cubit<OrderTileState> {
  OrderTileCubit(this._getDirection) : super(const OrderTileState.initial());

  final GetDirectionUsecase _getDirection;

  Direction? direction;

  int index = 0;

  Future<void> getDirection(LatLng location, LatLng destinationLocation) async {
    final response = await _getDirection
        .call(DirectionParams(location, destinationLocation));

    response.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message!));
        }
      },
      (r) {
        direction = r;
        emit(_Success(index, direction!));
      },
    );
  }

  Future<void> checkStatus(RepairOrder order) async {
    emit(const _Initial());
    if (order.status == Status.konfirmasiTeknisi.name) {
      index = 0;
      emit(_Success(index, direction));
    } else if (order.status == Status.menungguTeknisi.name) {
      index = 1;
      if (direction == null) {
        await getDirection(order.clientLocation!, order.technicianLocation!);
      }
      emit(_Success(index, direction));
    } else if (order.status == Status.pengecekanElektronik.name) {
      index = 2;
      emit(_Success(index, direction));
    } else if (order.status == Status.konfirmasiPerbaikan.name) {
      index = 3;
      emit(_Success(index, direction));
    } else if (order.status == Status.perbaikanElektronik.name) {
      index = 4;
      emit(_Success(index, direction));
    } else if (order.status == Status.pembayaran.name) {
      index = 5;
      emit(_Success(index, direction));
    } else if (order.status == Status.beriUlasan.name) {
      index = 6;
      emit(_Success(index, direction));
    } else if (order.status == Status.pesananSelesai.name) {
      index = 7;
      emit(_Success(index, direction));
    } else {
      index = 99;
      emit(_Success(index, direction));
    }
  }
}
