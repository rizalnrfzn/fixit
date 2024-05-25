import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    super.key,
    this.index = 0,
  });

  final int index;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.index,
    );

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: MyAppBar(context, title: Strings.of(context)!.order).call(),
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (_, state) {
          return SafeArea(
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: Strings.of(context)!.inProgress),
                    Tab(text: Strings.of(context)!.history),
                    Tab(text: Strings.of(context)!.canceled),
                  ],
                  controller: _tabController,
                  labelPadding: const EdgeInsets.all(0),
                  indicatorWeight: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  unselectedLabelColor: Theme.of(context).hintColor,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Dimens.space24),
                        child: const OnprogressTab(),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Dimens.space24),
                        child: const DoneTab(),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Dimens.space24),
                        child: const CancelledTab(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
