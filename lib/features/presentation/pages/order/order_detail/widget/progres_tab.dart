import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/features/presentation/pages/order/order_step/cubit/post_review_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgresTab extends StatefulWidget {
  const ProgresTab({
    super.key,
    required this.index,
    required this.repairOrder,
  });

  final int index;
  final RepairOrder repairOrder;

  @override
  State<ProgresTab> createState() => _ProgresTabState();
}

class _ProgresTabState extends State<ProgresTab> {
  late final TextEditingController ulasan;
  var rating = 0;

  final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    ulasan = TextEditingController();
  }

  @override
  void dispose() {
    TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailCubit, OrderDetailState>(
      builder: (_, state) {
        return state.maybeWhen(
          orElse: () => const Center(
            child: Loading(),
          ),
          success: (index, direction) {
            return BlocProvider(
              create: (context) => sl<PostReviewCubit>(),
              child: Stepper(
                controlsBuilder: (context, details) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8);
                },
                type: StepperType.vertical,
                currentStep: widget.index,
                onStepTapped: null,
                steps: [
                  Step(
                    isActive: widget.index >= 0 ? true : false,
                    title: const Text('Konfirmasi Teknisi'),
                    content: const Text('Menunggu konfirmasi teknisi'),
                  ),
                  Step(
                    isActive: widget.index >= 1 ? true : false,
                    title: const Text('Menunggu Teknisi'),
                    content: context.read<OrderDetailCubit>().direction == null
                        ? SizedBox(
                            height: 450.h,
                            child: const Center(child: Loading()),
                          )
                        : WaitingTechnicianContainer(
                            repairOrder: widget.repairOrder,
                            direction:
                                context.read<OrderDetailCubit>().direction!,
                            mapHeight: 450.h,
                          ),
                  ),
                  Step(
                    isActive: widget.index >= 2 ? true : false,
                    title: const Text('Pengecekan Elektronik'),
                    content: const Text('Pengecekan Elektronik oleh Teknisi'),
                  ),
                  Step(
                    isActive: widget.index >= 3 ? true : false,
                    title: const Text('Konfirmasi Perbaikan'),
                    content:
                        RepairConfirmationContainer(order: widget.repairOrder),
                  ),
                  Step(
                    isActive: widget.index >= 4 ? true : false,
                    title: const Text('Perbaikan Elektronik'),
                    content: const Text('Perbaikan elektronik oleh teknisi'),
                  ),
                  Step(
                    isActive: widget.index >= 5 ? true : false,
                    title: const Text('Pembayaran'),
                    content: widget.repairOrder.pay == false
                        ? PaymentContainer(order: widget.repairOrder)
                        : const Text(
                            'Menuggu konfirmasi pembayaran oleh teknisi.'),
                  ),
                  Step(
                    isActive: widget.index >= 6 ? true : false,
                    title: const Text('Beri Ulasan'),
                    content: PostReviewContainer(order: widget.repairOrder),
                  ),
                  Step(
                    isActive: widget.index >= 7 ? true : false,
                    title: const Text('Pesanan Selesai'),
                    content: const Text('Pesanan telah selesai'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
