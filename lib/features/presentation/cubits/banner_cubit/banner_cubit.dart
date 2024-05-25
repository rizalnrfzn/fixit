import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_state.dart';
part 'banner_cubit.freezed.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this._getAllBanner) : super(const _Loading());

  final GetAllBannerUsecase _getAllBanner;

  List<BannerAd> banners = [];

  Future<void> getAllBanner() async {
    final data = await _getAllBanner.call(NoParams());

    data.fold(
      (l) {
        if (l is FirestoreFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        banners.clear();
        banners.addAll(r);
        emit(const _Success());
      },
    );
  }
}
