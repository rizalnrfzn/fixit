import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({
    super.key,
    required this.orderId,
  });

  final String orderId;

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    // final colorTheme = Theme.of(context).extension<MyAppColors>()!;

    return Parent(
      appBar:
          MyAppBar(context, title: Strings.of(context)!.orderDetails).call(),
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (_, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: Loading()),
            stream: (orders) {
              final repairOrder =
                  orders.firstWhere((element) => element.id == widget.orderId);
              context.read<OrderDetailCubit>().checkStatus(
                    repairOrder.status!,
                    repairOrder.clientLocation!,
                    context
                        .read<TechnicianCubit>()
                        .technicians
                        .firstWhere((element) =>
                            element.uid == repairOrder.technicianUid)
                        .currentLocation!,
                  );
              return SafeArea(
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(text: Strings.of(context)!.details),
                        Tab(text: Strings.of(context)!.progres),
                      ],
                      controller: _tabController,
                      labelPadding: const EdgeInsets.all(0),
                      indicatorWeight: 3,
                      unselectedLabelColor: Theme.of(context).hintColor,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          DetailTab(
                            order: context.read<OrderCubit>().orders.firstWhere(
                                (element) => element.id == widget.orderId),
                          ),
                          ProgresTab(
                            index: context.read<OrderDetailCubit>().index,
                            repairOrder: orders.firstWhere(
                                (element) => element.id == widget.orderId),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
