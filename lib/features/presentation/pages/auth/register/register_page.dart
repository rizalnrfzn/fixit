import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /// Controller
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conPasswordRepeat = TextEditingController();

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();
  final _fnPasswordRepeat = FocusNode();

  /// Global key form
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: MyAppBar(context).call(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          state.whenOrNull(
            loading: () => context.show(),
            successRegister: (data) {
              context.dismiss();

              context.go(Routes.registerData.path);
            },
            failure: (message) {
              context.dismiss();

              message.toToastError(context);
            },
          );
        },
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (_, state) {
            state.whenOrNull();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimens.space24),
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpacerV(value: 50.h),
                    Text(
                      Strings.of(context)!.createAccount,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SpacerV(),
                    TextF(
                      key: const Key("email"),
                      curFocusNode: _fnEmail,
                      nextFocusNode: _fnPassword,
                      textInputAction: TextInputAction.next,
                      controller: _conEmail,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      hintText: Strings.of(context)!.email,
                      hint: Strings.of(context)!.email,
                      validator: (String? value) => value != null
                          ? (!value.isValidEmail()
                              ? Strings.of(context)?.errorInvalidEmail
                              : null)
                          : null,
                    ),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (_, state) {
                        return Column(
                          children: [
                            TextF(
                              key: const Key("password"),
                              curFocusNode: _fnPassword,
                              nextFocusNode: _fnPasswordRepeat,
                              textInputAction: TextInputAction.next,
                              controller: _conPassword,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                              ),
                              obscureText: context
                                      .read<RegisterCubit>()
                                      .isPasswordHide ??
                                  false,
                              hintText: Strings.of(context)!.password,
                              maxLine: 1,
                              hint: Strings.of(context)!.password,
                              suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () => context
                                    .read<RegisterCubit>()
                                    .showHidePassword(),
                                icon: Icon(
                                  (context
                                              .read<RegisterCubit>()
                                              .isPasswordHide ??
                                          false)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              validator: (String? value) => value != null
                                  ? (value.length < 6
                                      ? Strings.of(context)!.errorPasswordLength
                                      : null)
                                  : null,
                              semantic: "password",
                            ),
                            TextF(
                              key: const Key("repeat_password"),
                              curFocusNode: _fnPasswordRepeat,
                              textInputAction: TextInputAction.done,
                              controller: _conPasswordRepeat,
                              keyboardType: TextInputType.text,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                              ),
                              obscureText: context
                                      .read<RegisterCubit>()
                                      .isPasswordRepeatHide ??
                                  false,
                              hintText: Strings.of(context)!.passwordRepeat,
                              maxLine: 1,
                              hint: Strings.of(context)!.passwordRepeat,
                              suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () => context
                                    .read<RegisterCubit>()
                                    .showHidePasswordRepeat(),
                                icon: Icon(
                                  (context
                                              .read<RegisterCubit>()
                                              .isPasswordRepeatHide ??
                                          false)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              validator: (String? value) => value != null
                                  ? (value != _conPassword.text
                                      ? Strings.of(context)
                                          ?.errorPasswordNotMatch
                                      : null)
                                  : null,
                              semantic: "repeat_password",
                            ),
                          ],
                        );
                      },
                    ),
                    SpacerV(value: Dimens.space24),
                    Button(
                      key: const Key("btn_register"),
                      title: Strings.of(context)!.register,
                      onPressed: () {
                        /// Validate form first
                        if (_keyForm.currentState?.validate() ?? false) {
                          context.read<AuthCubit>().register(
                                RegisterParams(
                                  email: _conEmail.text,
                                  password: _conPassword.text,
                                ),
                              );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
