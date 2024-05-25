import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_data_state.dart';
part 'register_data_cubit.freezed.dart';

class RegisterDataCubit extends Cubit<RegisterDataState> {
  RegisterDataCubit() : super(const RegisterDataState.initial());

  File? picture;

  void pickProfilePicture() async {
    emit(const _Initial());
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      File file = File(result.files.single.path!);
      picture = file;
      emit(_ProfilePicture(file));
    } else {
      if (picture == null) {
        emit(const _Initial());
      }
    }
  }
}
