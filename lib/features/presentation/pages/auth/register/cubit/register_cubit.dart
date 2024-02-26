import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const _Init());

  bool? isPasswordHide = true;
  bool? isPasswordRepeatHide = true;

  void showHidePassword() {
    emit(const _Init());
    isPasswordHide = !(isPasswordHide ?? false);
    emit(const _ShowHidePassword());
  }

  void showHidePasswordRepeat() {
    emit(const _Init());
    isPasswordRepeatHide = !(isPasswordRepeatHide ?? false);
    emit(const _ShowHidePassword());
  }
}
