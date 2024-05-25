import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const _Initial());

  bool? isPasswordHide = true;

  void showHidePassword() {
    emit(const _Initial());
    isPasswordHide = !(isPasswordHide ?? false);
    emit(const _ShowHide());
  }
}
