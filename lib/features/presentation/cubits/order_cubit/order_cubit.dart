import 'dart:async';

import 'package:fixit/core/error/failure.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.dart';
part 'order_cubit.freezed.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(
    this._stremOrders,
    this._acceptRepair,
    this._rejectRepair,
    this._paymentOrder,
    this._postReview,
    this._cancelOrder,
  ) : super(const OrderState.initial());

  final StreamRepairOrdersUsecase _stremOrders;
  final AcceptRepairOrderUsecase _acceptRepair;
  final RejectRepairOrderUsecase _rejectRepair;
  final PaymentOrderUsecase _paymentOrder;
  final PostReviewUsecase _postReview;
  final CancelOrderUsecase _cancelOrder;

  StreamSubscription? _ordersSubscription;
  List<RepairOrder> orders = [];

  void streamOrders(String uid) async {
    orders = [];
    _ordersSubscription?.cancel();
    _ordersSubscription = _stremOrders.call(uid).listen((event) {
      orders = event;

      emit(_Stream(orders));
    });
  }

  Future<void> acceptRepair(RepairOrder params) async {
    final response = await _acceptRepair.call(params);

    response.fold((l) {
      if (l is FirestoreFailure) {
        emit(_Failure(l.code));
      }
    }, (r) => r);
  }

  Future<void> rejectRepair(RepairOrder params) async {
    final response = await _rejectRepair.call(params);

    response.fold((l) {
      if (l is FirestoreFailure) {
        emit(_Failure(l.code));
      }
    }, (r) => r);
  }

  Future<void> paymentOrder(RepairOrder params) async {
    final response = await _paymentOrder.call(params);

    response.fold((l) {
      if (l is FirestoreFailure) {
        emit(_Failure(l.code));
      }
    }, (r) => r);
  }

  Future<void> cancelOrder(RepairOrder params) async {
    final response = await _cancelOrder.call(params);

    response.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) => r,
    );
  }

  Future<void> review(PostReviewParams params) async {
    final response = await _postReview.call(params);

    response.fold((l) {
      if (l is FirestoreFailure) {
        emit(_Failure(l.code));
      }
    }, (r) => r);
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
