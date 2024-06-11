import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnprogressTab extends StatelessWidget {
  const OnprogressTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> filterOnProgres = [
      Status.pesananSelesai.name,
    ];

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (_, state) {
        return state.maybeWhen(
          orElse: () => const Center(
            child: Loading(),
          ),
          stream: (orders) {
            return orders
                    .where((element) =>
                        element.cancelled != true &&
                        !(filterOnProgres.contains(element.status)))
                    .isEmpty
                ? const Center(
                    child: Text('Tidak ada order'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        orders
                            .where((element) =>
                                element.cancelled != true &&
                                !(filterOnProgres.contains(element.status)))
                            .length,
                        (index) => BlocProvider(
                          create: (context) => sl<OrderTileCubit>(),
                          child: OrderListTile(
                            repairOrder: orders
                                .where((element) =>
                                    element.cancelled != true &&
                                    !(filterOnProgres.contains(element.status)))
                                .toList()[index],
                          ),
                        ),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
