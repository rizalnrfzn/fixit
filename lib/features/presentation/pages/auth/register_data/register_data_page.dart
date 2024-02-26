import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/ext/context.dart';
import 'package:fixit/utils/ext/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterDataPage extends StatefulWidget {
  const RegisterDataPage({super.key});

  @override
  State<RegisterDataPage> createState() => _RegisterDataPageState();
}

class _RegisterDataPageState extends State<RegisterDataPage> {
  late GlobalKey<FormState> _keyForm;

  // controller
  late TextEditingController _conName;
  late TextEditingController _conNumberPhone;

  // focus node
  late FocusNode _fnName;
  late FocusNode _fnNumberPhone;

  @override
  void initState() {
    _keyForm = GlobalKey<FormState>();
    _conName = TextEditingController();
    _conNumberPhone = TextEditingController();
    _fnName = FocusNode();
    _fnNumberPhone = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _keyForm.currentState?.dispose();
    _conName.dispose();
    _conNumberPhone.dispose();
    _fnName.dispose();
    _fnNumberPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: MyAppBar(
        context,
        title: Strings.of(context)!.fillYourProfile,
        action: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(
                  Strings.of(context)!.logout,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                content: Text(
                  Strings.of(context)!.logoutDesc,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                actions: [
                  TextButton(
                    onPressed: () => context.back(),
                    child: Text(
                      Strings.of(context)!.cancel,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .extension<MyAppColors>()!
                                .subtitle,
                          ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                    },
                    child: Text(
                      Strings.of(context)!.yes,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .extension<MyAppColors>()!
                                .blue,
                          ),
                    ),
                  ),
                ],
              ),
            );
          },
          icon: const Icon(Icons.logout),
        ),
      ).call(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          state.whenOrNull(
            loading: () => context.show(),
            successRegisterData: (data) {
              context.dismiss();
              context.go(Routes.root.path);
            },
            logedOut: () {
              context.go(Routes.login.path);
            },
            failure: (message) {
              context.dismiss();

              message.toToastError(context);
            },
          );
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimens.space24),
            child: Form(
              key: _keyForm,
              child: Column(
                children: [
                  Stack(
                    children: [
                      BlocBuilder<RegisterDataCubit, RegisterDataState>(
                        builder: (_, state) {
                          return state.when(
                            profilePicture: (picture) => CircleAvatar(
                              radius: Dimens.space70,
                              backgroundColor: Theme.of(context).hintColor,
                              child: CircleAvatar(
                                radius: Dimens.space70 - Dimens.space4,
                                backgroundImage: FileImage(picture),
                              ),
                            ),
                            initial: () => ProfilePicture(
                              pictureUrl: context
                                  .read<AuthCubit>()
                                  .authUser!
                                  .profilePicture!,
                              onTap: () {},
                              radius: Dimens.space70,
                            ),
                          );
                        },
                      ),
                      Positioned(
                        top: 110.w,
                        left: 100.w,
                        child: InkWell(
                          onTap: () {
                            context
                                .read<RegisterDataCubit>()
                                .pickProfilePicture();
                          },
                          child: Container(
                            height: Dimens.space30,
                            width: Dimens.space30,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .extension<MyAppColors>()!
                                  .blue,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: Dimens.space16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SpacerH(
                    value: Dimens.space16,
                  ),
                  TextF(
                    key: const Key('name'),
                    curFocusNode: _fnName,
                    nextFocusNode: _fnNumberPhone,
                    textInputAction: TextInputAction.next,
                    controller: _conName,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    hintText: Strings.of(context)!.name,
                    hint: Strings.of(context)!.name,
                    validator: (String? value) => value != ''
                        ? null
                        : Strings.of(context)!.errorEmptyField,
                  ),
                  TextF(
                    key: const Key('number_phone'),
                    curFocusNode: _fnNumberPhone,
                    textInputAction: TextInputAction.next,
                    controller: _conNumberPhone,
                    keyboardType: TextInputType.phone,
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(13)
                    ],
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    hintText: Strings.of(context)!.phoneNumber,
                    hint: Strings.of(context)!.phoneNumber,
                    validator: (String? value) => value != null
                        ? (value.length < 10
                            ? Strings.of(context)!.errorInvalidPhoneNumber
                            : null)
                        : null,
                  ),
                  SpacerV(value: Dimens.space24),
                  Button(
                    key: const Key("btn_register_data"),
                    title: Strings.of(context)!.cntnue,
                    onPressed: () {
                      /// Validate form first
                      if (_keyForm.currentState?.validate() ?? false) {
                        context.read<AuthCubit>().registerData(
                              RegisterDataParams(
                                  name: _conName.text,
                                  phoneNumber: _conNumberPhone.text,
                                  profilePicture: context
                                      .read<RegisterDataCubit>()
                                      .picture),
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
    );
  }
}
