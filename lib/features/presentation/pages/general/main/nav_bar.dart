import 'package:fixit/core/core.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'cubit/main_cubit.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.dataMenu,
    required this.currentIndex,
  });

  final List<DataHelper> dataMenu;
  final int currentIndex;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      onTap: (value) {
        context.read<MainCubit>().updateIndex(value);

        _selectedPage(value);
      },
      items: widget.dataMenu
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(e.icon),
              label: e.title,
            ),
          )
          .toList(),
    );
  }

  void _selectedPage(int index) {
    //Update page from selected Page
    if (index == 0) {
      context.go(Routes.dashboard.path);
    } else if (index == 1) {
      context.go(Routes.map.path);
    } else if (index == 2) {
      context.go(Routes.order.path);
    } else if (index == 3) {
      context.go(Routes.chat.path);
    } else if (index == 4) {
      context.go(Routes.profile.path);
    }
  }
}
