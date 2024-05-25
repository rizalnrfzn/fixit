import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CancelledTab extends StatelessWidget {
  const CancelledTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (_, state) {
        return state.maybeWhen(
          orElse: () => const Center(
            child: Loading(),
          ),
          stream: (orders) {
            return orders.where((element) => element.cancelled == true).isEmpty
                ? const Center(
                    child: Text('Tidak ada order'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        orders
                            .where((element) => element.cancelled == true)
                            .length,
                        (index) => OrderCanceledListTile(
                          repairOrder: orders
                              .where((element) => element.cancelled == true)
                              .toList()[index],
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
