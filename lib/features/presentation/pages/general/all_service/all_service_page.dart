import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllServicePage extends StatelessWidget {
  const AllServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: MyAppBar(context, title: Strings.of(context)!.service).call(),
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(Dimens.space24),
        child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 8.5 / 10,
          crossAxisSpacing: Dimens.space16,
          mainAxisSpacing: Dimens.space16,
          children: List.generate(
            context.read<ElectronicCubit>().services.length,
            (index) => ServiceIcon(
              index: index,
              electronic: context.read<ElectronicCubit>().services[index],
            ),
          ),
        ),
      )),
    );
  }
}
