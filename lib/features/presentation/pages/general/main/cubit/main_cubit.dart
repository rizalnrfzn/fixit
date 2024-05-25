import 'package:fixit/core/core.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const _Loading());

  int currentIndex = 0;
  late List<DataHelper> dataMenus;

  void updateIndex(int index, {BuildContext? context}) {
    emit(const _Loading());
    currentIndex = index;
    if (context != null) {
      initMenu(context);
    }
    emit(_Success(dataMenus[currentIndex], currentIndex));
  }

  void initMenu(BuildContext context) {
    dataMenus = [
      DataHelper(
        id: 0,
        title: Strings.of(context)!.dashboard,
        icon: Icons.home,
        isSelected: true,
      ),
      DataHelper(
        id: 1,
        title: Strings.of(context)!.map,
        icon: Icons.map,
        isSelected: false,
      ),
      DataHelper(
        id: 2,
        title: Strings.of(context)!.order,
        icon: Icons.list_alt,
        isSelected: false,
      ),
      DataHelper(
        id: 3,
        title: Strings.of(context)!.chat,
        icon: Icons.chat,
        isSelected: false,
      ),
      DataHelper(
        id: 4,
        title: Strings.of(context)!.profile,
        icon: Icons.person,
        isSelected: false,
      ),
    ];
    updateIndex(currentIndex);
  }

  bool onBackPressed(
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldState,
  ) {
    if (currentIndex == 0) {
      return true;
    } else {
      if (scaffoldState.currentState!.isEndDrawerOpen) {
        //hide navigation drawer
        scaffoldState.currentState!.openDrawer();
      } else {
        for (final menu in dataMenus) {
          menu.isSelected = menu.title == Strings.of(context)!.dashboard;
        }
      }

      return false;
    }
  }
}
