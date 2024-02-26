import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechnicianListPage extends StatelessWidget {
  const TechnicianListPage({
    super.key,
    this.filter,
  });

  final String? filter;

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: MyAppBar(context,
              title: filter == null
                  ? 'Technician'
                  : (MainBoxMixin.mainBox?.get(MainBoxKeys.locale.name)
                                  as String? ??
                              'en') ==
                          'en'
                      ? context
                          .read<ElectronicCubit>()
                          .electronics
                          .firstWhere((element) => element.id == filter)
                          .englishName!
                      : context
                          .read<ElectronicCubit>()
                          .electronics
                          .firstWhere((element) => element.id == filter)
                          .name!)
          .call(),
      child: BlocBuilder<TechnicianCubit, TechnicianState>(
        builder: (context, state) {
          return SafeArea(
            child: context
                    .read<TechnicianCubit>()
                    .technicians
                    .where((element) => element.electronics!.contains(filter))
                    .isEmpty
                ? Center(
                    child: Text(Strings.of(context)!.noTechnician),
                  )
                : Column(
                    children: List.generate(
                      context
                          .read<TechnicianCubit>()
                          .technicians
                          .where((element) =>
                              element.electronics!.contains(filter))
                          .length,
                      (index) => Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Dimens.space24),
                        child: TechnicianListTile(
                          technician: context
                              .read<TechnicianCubit>()
                              .technicians
                              .where((element) =>
                                  element.electronics!.contains(filter))
                              .toList()[index],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
