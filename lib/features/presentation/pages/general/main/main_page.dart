import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MainCubit>().initMenu(context);
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          Strings.of(context)!.exit,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        content: Text(
          Strings.of(context)!.exitDesc,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              Strings.of(context)!.cancel,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).extension<MyAppColors>()!.subtitle,
                  ),
            ),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text(
              Strings.of(context)!.yes,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).extension<MyAppColors>()!.blue,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (context.read<MainCubit>().currentIndex == 0) {
          _showExitDialog();
        } else {
          context.read<MainCubit>().updateIndex(0);
          context.go(Routes.dashboard.path);
          false;
        }
      },
      child: Parent(
        bottomNavigation: NavBar(
          dataMenu: context.read<MainCubit>().dataMenus,
          currentIndex: context.read<MainCubit>().currentIndex,
        ),
        child: widget.child,
      ),
    );
  }
}
