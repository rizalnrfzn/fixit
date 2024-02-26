import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'make_order_state.dart';
part 'make_order_cubit.freezed.dart';

class MakeOrderCubit extends Cubit<MakeOrderState> {
  MakeOrderCubit(
    this._getLocation,
    this._getDirection,
  ) : super(const MakeOrderState.initial());

  final GetLocationUsecase _getLocation;
  final GetDirectionUsecase _getDirection;

  int index = 0;
  String? idElectronic;
  List<String> listGripes = [];
  List<String> gripes = [];
  Geolocation? geolocation;
  Direction? direction;
  List<File> files = [];

  void nextStep() {
    index += 1;
    emit(_Step(index));
  }

  void backStep() {
    index -= 1;
    emit(_Step(index));
  }

  void selectElectronic(String id) {
    idElectronic = id;
    gripes = [];
    files = [];
    emit(_SelectedElectronic(idElectronic!));
  }

  void changeGripes(List<String> listGripe) {
    listGripes = [];
    listGripes.addAll(listGripe);
    emit(const _Initial());
  }

  void addGripe(String gripe) {
    emit(const _Initial());
    gripes.add(gripe);
    emit(_Gripes(gripes));
  }

  void removeGripe(String gripe) {
    emit(const _Initial());
    gripes.removeWhere((element) => element == gripe);
    emit(_Gripes(gripes));
  }

  void getCurrentLocation(LatLng destinationLocation) async {
    final data = await _getLocation.call(NoParams());

    data.fold(
      (l) {
        if (l is LocationError) {
          emit(_Failure(l.code));
        }
      },
      (r) async {
        geolocation = r;
        emit(_Location(geolocation!));
        emit(_Direction(direction!));
      },
    );
  }

  Future<Direction?> getDirection(
      LatLng location, LatLng destinationLocation) async {
    final data = await _getDirection
        .call(DirectionParams(location, destinationLocation));

    data.fold(
      (l) {
        if (l is LocationError) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        direction = r;
        emit(_Direction(direction!));
        return direction;
      },
    );
    return null;
  }

  void pickFiles() async {
    emit(const _Initial());
    final result = await FilePicker.platform.pickFiles(
      type: FileType.media,
      allowCompression: true,
      allowMultiple: true,
    );
    if (result != null) {
      final filesData = result.paths.map((e) => File(e!)).toList();
      files.addAll(filesData);
      emit(_Files(files));
    } else {
      if (files.isEmpty) {
        emit(_Files(files));
      }
    }
  }

  void removeFiles(int index) {
    emit(const _Initial());
    files.removeAt(index);
    emit(_Files(files));
  }
}
