import 'dart:async';

import 'package:fixit/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.dart';
part 'order_cubit.freezed.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._stremOrders) : super(const OrderState.initial());

  final StreamRepairOrdersUsecase _stremOrders;

  StreamSubscription? _ordersSubscription;
  List<RepairOrder> orders = [];

  void streamOrders(String uid) async {
    orders = [];
    _ordersSubscription?.cancel();
    _ordersSubscription = _stremOrders.call(uid).listen((event) {
      orders = event;
      orders.sort(
        (a, b) => a.dateTime!.compareTo(b.dateTime!),
      );
      emit(_Stream(orders));
    });
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
