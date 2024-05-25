import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
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
                  : context
                      .read<ElectronicCubit>()
                      .electronics
                      .firstWhere((element) => element.id == filter)
                      .name!)
          .call(),
      child: BlocBuilder<TechnicianCubit, TechnicianState>(
        builder: (context, state) {
          if (filter != null) {
            return SafeArea(
              child: context
                      .read<TechnicianCubit>()
                      .technicians
                      .where(
                          (element) => element.electronicId!.contains(filter))
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
                                element.electronicId!.contains(filter))
                            .length,
                        (index) => Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Dimens.space16),
                          child: TechnicianListTile(
                            technician: context
                                .read<TechnicianCubit>()
                                .technicians
                                .where((element) =>
                                    element.electronicId!.contains(filter))
                                .toList()[index],
                          ),
                        ),
                      ),
                    ),
            );
          } else {
            return SafeArea(
              child: context.read<TechnicianCubit>().technicians.isEmpty
                  ? Center(
                      child: Text(Strings.of(context)!.noTechnician),
                    )
                  : Column(
                      children: List.generate(
                        context.read<TechnicianCubit>().technicians.length,
                        (index) => Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Dimens.space16),
                          child: TechnicianListTile(
                            technician: context
                                .read<TechnicianCubit>()
                                .technicians[index],
                          ),
                        ),
                      ),
                    ),
            );
          }
        },
      ),
    );
  }
}
