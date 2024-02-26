import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Controller
  final _conEmail = TextEditingController(text: 'levelsekawan@gmail.com');
  final _conPassword = TextEditingController(text: 'coba123');

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();

  /// Global key
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          state.whenOrNull(
            loading: () => context.show(),
            successLogin: (data) {
              context.dismiss();
              'Success'.toToastSuccess(context);

              if (data!.isRegistered!) {
                context.go(Routes.dashboard.path);
              } else {
                context.push(Routes.registerData.path);
              }

              TextInput.finishAutofillContext();
            },
            failure: (message) {
              context.dismiss();
              message.toToastError(context);
            },
          );
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimens.space24),
              child: AutofillGroup(
                child: Form(
                  key: _keyForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpacerV(value: 110.h),
                      Text(
                        Strings.of(context)!.loginToAccount,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SpacerV(value: 24.h),
                      TextF(
                        autofillHints: const [AutofillHints.email],
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
                        hintText: "Email",
                        hint: Strings.of(context)!.email,
                        validator: (String? value) => value != null
                            ? (!value.isValidEmail()
                                ? Strings.of(context)?.errorInvalidEmail
                                : null)
                            : null,
                      ),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (_, state) {
                          return TextF(
                            autofillHints: const [AutofillHints.password],
                            key: const Key("password"),
                            curFocusNode: _fnPassword,
                            textInputAction: TextInputAction.done,
                            controller: _conPassword,
                            keyboardType: TextInputType.text,
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                            obscureText:
                                context.read<LoginCubit>().isPasswordHide ??
                                    false,
                            hintText: 'Password',
                            maxLine: 1,
                            hint: Strings.of(context)!.password,
                            suffixIcon: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () =>
                                  context.read<LoginCubit>().showHidePassword(),
                              icon: Icon(
                                (context.read<LoginCubit>().isPasswordHide ??
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
                          );
                        },
                      ),
                      SpacerV(value: Dimens.space24),
                      Button(
                        title: Strings.of(context)!.login,
                        onPressed: () {
                          if (_keyForm.currentState?.validate() ?? false) {
                            context.read<AuthCubit>().login(
                                  LoginParams(
                                    email: _conEmail.text,
                                    password: _conPassword.text,
                                  ),
                                );
                          }
                        },
                      ),
                      ButtonText(
                        title: Strings.of(context)!.askRegister,
                        onPressed: () {
                          /// Direct to register page
                          context.pushNamed(Routes.register.name);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
