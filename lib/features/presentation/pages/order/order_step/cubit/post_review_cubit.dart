import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_review_state.dart';
part 'post_review_cubit.freezed.dart';

class PostReviewCubit extends Cubit<PostReviewState> {
  PostReviewCubit() : super(const PostReviewState.initial());

  List<File> files = [];

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
