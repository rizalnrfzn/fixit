import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_summary_state.dart';
part 'order_summary_cubit.freezed.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  OrderSummaryCubit(this._postOrder) : super(const _Initial());

  final PostOrderUsecase _postOrder;

  Future<void> postOrder(PostOrderParams params) async {
    emit(const _Loading());
    final response = await _postOrder.call(params);

    response.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        emit(_Success(r));
      },
    );
  }
}
