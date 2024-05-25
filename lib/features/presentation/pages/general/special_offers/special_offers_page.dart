import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialOffersPage extends StatelessWidget {
  const SpecialOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar:
          MyAppBar(context, title: Strings.of(context)!.specialOffers).call(),
      child: SafeArea(
        child: BlocBuilder<BannerCubit, BannerState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: Loading()),
              failure: (message) => Empty(errorMessage: message),
              success: () {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.space24),
                  child: Column(
                    children: List.generate(
                      context.read<BannerCubit>().banners.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: Dimens.space12),
                        child: Container(
                          height: 200.w,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: CachedNetworkImage(
                              imageUrl: context
                                  .read<BannerCubit>()
                                  .banners[index]
                                  .image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
