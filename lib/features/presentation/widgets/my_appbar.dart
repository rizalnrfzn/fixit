import 'package:flutter/material.dart';

class MyAppBar {
  const MyAppBar(this.context, {this.title = '', this.action});

  final BuildContext context;
  final String title;
  final Widget? action;

  PreferredSize call() => PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          actions: action == null ? null : [action!],
        ),
      );
}
