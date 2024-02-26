import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TechnicianListTile extends StatelessWidget {
  const TechnicianListTile({
    super.key,
    required this.technician,
  });

  final Technician technician;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.space16),
      child: InkWell(
        borderRadius: BorderRadius.circular(30.r),
        onTap: () {
          context.push(Routes.technicianDetail.path, extra: technician.uid!);
        },
        child: Container(
          height: 165.w,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .extension<MyAppColors>()!
                .card!
                .withOpacity(0.5),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(Dimens.space24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: Container(
                    height: 117.w,
                    width: 117.w,
                    color: Theme.of(context).hintColor.withOpacity(0.3),
                    child: CachedNetworkImage(
                        imageUrl: technician.profilePicture!),
                  ),
                ),
              ),
              SizedBox(
                height: 117.w,
                width: 191.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<TechnicianCubit, TechnicianState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Text(
                                '${toKiloMeter(technician.direction!.routes![0].distance!)}km'),
                            const Spacer(),
                            technician.isOnline!
                                ? const Text('online')
                                : const Text('offline'),
                          ],
                        );
                      },
                    ),
                    const Spacer(),
                    Text(
                      technician.name!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      technician.description!,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context)
                              .extension<MyAppColors>()!
                              .yellow,
                          size: Dimens.space20,
                        ),
                        SpacerH(value: Dimens.space6),
                        Text(
                            '${technician.rating}   |   ${technician.numberOfReviews} reviews')
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
