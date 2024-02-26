import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    super.key,
    required this.dataMenu,
    required this.currentIndex,
    required this.onLogoutPressed,
  });

  final List<DataHelper> dataMenu;
  final Function(int) currentIndex;
  final VoidCallback onLogoutPressed;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: context.widthInPercent(100),
            height: Dimens.header,
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            color: Theme.of(context).extension<MyAppColors>()!.card,
            child: SafeArea(
              child: Row(
                children: [
                  ProfilePicture(
                    pictureUrl:
                        context.read<AuthCubit>().authUser!.profilePicture!,
                    onTap: () {},
                    radius: Dimens.space40,
                  ),
                  const SpacerH(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.read<AuthCubit>().authUser!.name!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLargeBold
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          context.read<AuthCubit>().authUser!.email!,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .extension<MyAppColors>()!
                                        .shadow,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SpacerV(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.dataMenu
                .map<Widget>(
                  (value) => SizedBox(
                    width: double.maxFinite,
                    child: InkWell(
                      onTap: () {
                        for (final menu in widget.dataMenu) {
                          menu.isSelected = menu.title == value.title;

                          if (value.title != null) {
                            widget.currentIndex(
                              widget.dataMenu.indexOf(value),
                            );
                          }
                        }

                        _selectedPage(value.title!);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Dimens.space12,
                          horizontal: Dimens.space24,
                        ),
                        child: Row(
                          children: [
                            Icon(value.icon),
                            SpacerH(value: 8.w),
                            Text(
                              value.title!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ), //
          const SpacerH(),
        ],
      ),
    );
  }

  void _selectedPage(String title) {
    //Update page from selected Page
    if (title == Strings.of(context)!.settings) {
      context.goNamed(Routes.settings.name);
    } else if (title == Strings.of(context)!.dashboard) {
      context.goNamed(Routes.dashboard.name);
    } else if (title == Strings.of(context)!.logout) {
      widget.onLogoutPressed.call();
    }
  }
}
