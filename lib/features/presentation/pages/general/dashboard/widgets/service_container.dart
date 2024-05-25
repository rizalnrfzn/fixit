import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ServiceContainer extends StatelessWidget {
  const ServiceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElectronicCubit, ElectronicState>(
      builder: (_, __) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.space24),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    Strings.of(context)!.service,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  ButtonText(
                    title: Strings.of(context)!.seeAll,
                    onPressed: () {
                      context.push(Routes.allService.path);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 220.w,
                width: 400.w,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  childAspectRatio: 8.5 / 10,
                  crossAxisSpacing: Dimens.space16,
                  mainAxisSpacing: Dimens.space16,
                  children: List.generate(
                    8,
                    (index) => ServiceIcon(
                      index: index,
                      electronic:
                          context.read<ElectronicCubit>().electronics[index],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
