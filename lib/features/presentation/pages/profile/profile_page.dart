import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: MyAppBar(context, title: Strings.of(context)!.profile).call(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            children: [
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      ProfilePicture(
                        pictureUrl:
                            context.read<AuthCubit>().authUser!.profilePicture!,
                        onTap: () {},
                        radius: Dimens.space60,
                      ),
                      SpacerV(value: Dimens.space6),
                      Text(
                        context.read<AuthCubit>().authUser!.name!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SpacerV(value: Dimens.space6),
                      Text(
                        context.read<AuthCubit>().authUser!.email!,
                      ),
                    ],
                  );
                },
              ),
              SpacerV(value: Dimens.space16),
              Divider(
                  color: Theme.of(context).extension<MyAppColors>()!.shadow),
              SpacerV(value: Dimens.space16),
              Column(children: [
                ListTile(
                  onTap: () {
                    context.push(Routes.editProfile.path);
                  },
                  title: Text(
                    Strings.of(context)!.editProfile,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  leading: Icon(
                    Icons.person_outline,
                    color:
                        Theme.of(context).extension<MyAppColors>()!.buttonText,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
                ListTile(
                  onTap: () {
                    context.push(Routes.settings.path);
                  },
                  title: Text(
                    Strings.of(context)!.applicationSettings,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  leading: Icon(
                    Icons.settings_outlined,
                    color:
                        Theme.of(context).extension<MyAppColors>()!.buttonText,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
                ListTile(
                  onTap: () {
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
                            onPressed: () => context.pop(),
                            child: Text(
                              Strings.of(context)!.cancel,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
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
                  title: Text(
                    Strings.of(context)!.logout,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  leading: Icon(
                    Icons.logout_outlined,
                    color:
                        Theme.of(context).extension<MyAppColors>()!.buttonText,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
