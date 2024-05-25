import 'dart:async';

import 'package:fixit/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'electronic_state.dart';
part 'electronic_cubit.freezed.dart';

class ElectronicCubit extends Cubit<ElectronicState> {
  ElectronicCubit(this._streamElectronics)
      : super(const ElectronicState.initial());

  final StreamElectronicsUsecase _streamElectronics;

  StreamSubscription? _electronicsSubscription;

  List<Electronic> electronics = [];
  List<Electronic> services = [];

  void streamElectronics() async {
    electronics = [];
    _electronicsSubscription?.cancel();
    _electronicsSubscription = _streamElectronics.call().listen((event) {
      electronics = event;
      Electronic more =
          event.firstWhere((element) => element.id == 'wzicVyX1YzsQfn9cmAaq');
      services = [];
      electronics.removeWhere((element) => element.id == more.id);
      services.addAll(electronics);
      electronics.insert(7, more);
      emit(_Stream(electronics));
    });
  }

  @override
  Future<void> close() {
    _electronicsSubscription?.cancel();
    return super.close();
  }
}
