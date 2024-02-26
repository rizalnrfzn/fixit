import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: RefreshIndicator(
        color: Theme.of(context).extension<MyAppColors>()!.blue,
        backgroundColor: Theme.of(context).extension<MyAppColors>()!.background,
        onRefresh: () async {
          context.read<ElectronicCubit>().streamElectronics();
          context.read<AuthCubit>().streamUser(
              MainBoxMixin.mainBox!.get(MainBoxKeys.authUserId.name));
          context.read<TechnicianCubit>().streamTechnicians();
        },
        child: SafeArea(
          child: BlocBuilder<TechnicianCubit, TechnicianState>(
            builder: (_, state) {
              return state.when(
                loading: () => const Center(child: Loading()),
                failure: (message) => Center(
                  child: Empty(errorMessage: message),
                ),
                streamTechnicians: (technicians, geolocation) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        TopBar(geolocation: geolocation),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Dimens.space24),
                          child: TextF(
                            prefixIcon: Icon(
                              Icons.search_outlined,
                              size: Dimens.space24,
                              color: Theme.of(context).hintColor,
                            ),
                            hintText: Strings.of(context)!.search,
                          ),
                        ),
                        const SpecialOffersContainer(),
                        const ServiceContainer(),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Dimens.space24),
                          child: Divider(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        RecomendationContainer(technicians: technicians),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
