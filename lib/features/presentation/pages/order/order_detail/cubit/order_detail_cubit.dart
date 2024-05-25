import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'order_detail_state.dart';
part 'order_detail_cubit.freezed.dart';

class OrderDetailCubit extends Cubit<OrderDetailState> {
  OrderDetailCubit(this._getDirection)
      : super(const OrderDetailState.initial());

  final GetDirectionUsecase _getDirection;

  int index = 0;
  int errorIndex = 0;

  Direction? direction;

  Future<void> checkStatus(
      String status, LatLng location, LatLng destinationLocation) async {
    if (status == Status.konfirmasiTeknisi.name) {
      index = 0;
      errorIndex = 0;
      emit(_Success(index, direction));
    } else if (status == Status.menungguTeknisi.name) {
      index = 1;
      errorIndex = 0;
      await getDirection(location, destinationLocation);
      emit(_Success(index, direction));
    } else if (status == Status.pengecekanElektronik.name) {
      index = 2;
      errorIndex = 0;
      emit(_Success(index, direction));
    } else if (status == Status.konfirmasiPerbaikan.name) {
      index = 3;
      errorIndex = 0;
      emit(_Success(index, direction));
    } else if (status == Status.perbaikanElektronik.name) {
      index = 4;
      errorIndex = 0;
      emit(_Success(index, direction));
    } else if (status == Status.pembayaran.name) {
      index = 5;
      errorIndex = 0;
      emit(_Success(index, direction));
    } else if (status == Status.beriUlasan.name) {
      index = 6;
      errorIndex = 0;
      emit(_Success(index, direction));
    } else if (status == Status.pesananSelesai.name) {
      index = 7;
      errorIndex = 0;
      emit(_Success(index, direction));
    } else {
      errorIndex = 99;
      emit(_Success(errorIndex, direction));
    }
  }

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
        emit(_Success(index, direction));
      },
    );
  }
}
