import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TechnicianDetailPage extends StatelessWidget {
  const TechnicianDetailPage({
    super.key,
    required this.uid,
  });

  final String uid;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;

    return Parent(
      bottomNavigation: ChatOrderContainer(uid: uid),
      child: SafeArea(
        child: BlocBuilder<TechnicianCubit, TechnicianState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: Loading()),
              failure: (message) => Center(child: Empty(errorMessage: message)),
              streamTechnicians: (technicians, geolocation) {
                final technician =
                    technicians.firstWhere((element) => element.uid == uid);
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 350.w,
                      flexibleSpace: FlexibleSpaceBar(
                        background: CachedNetworkImage(
                          imageUrl: technician.profilePicture!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              Dimens.space24,
                              Dimens.space24,
                              Dimens.space24,
                              Dimens.space12,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${technician.name}',
                                  style: textTheme.titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SpacerH(value: Dimens.space24),
                                Icon(
                                  Icons.star,
                                  color: colorTheme.yellow,
                                  size: Dimens.space20,
                                ),
                                Text(
                                  '${technician.rating} (${technician.numberOfReviews} ${Strings.of(context)!.reviews})',
                                  style: textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimens.space24,
                                vertical: Dimens.space12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: colorTheme.blue,
                                ),
                                SpacerH(value: Dimens.space8),
                                Text.rich(
                                  TextSpan(
                                    style: textTheme.bodyLarge,
                                    children: [
                                      TextSpan(text: '${technician.address} '),
                                      TextSpan(
                                          style: textTheme.bodySmall,
                                          text:
                                              '(${toKiloMeter(technician.direction!.routes![0].distance!)}km)'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimens.space24,
                                vertical: Dimens.space12),
                            child: Wrap(
                              children: List.generate(
                                technician.electronics!.length,
                                (index) => ElectronicChip(
                                  electronicId: technician.electronics![index],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimens.space24),
                            child: Divider(
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimens.space24,
                                vertical: Dimens.space12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.of(context)!.aboutMe,
                                  style: textTheme.titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SpacerV(value: Dimens.space8),
                                TextWithWrap(
                                  text: technician.description!,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimens.space24,
                              vertical: Dimens.space12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.of(context)!.photosVideos,
                                  style: textTheme.titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SpacerV(value: Dimens.space12),
                                PhotosVideosContainer(
                                  picture: technician.images!,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Dimens.space24, right: Dimens.space16),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: colorTheme.yellow,
                                ),
                                SpacerH(value: Dimens.space8),
                                Text(
                                  '${technician.rating} (${technician.numberOfReviews} ${Strings.of(context)!.reviews})',
                                  style: textTheme.titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                ButtonText(
                                  title: Strings.of(context)!.seeAll,
                                  onPressed: () {
                                    context.push(Routes.review.path,
                                        extra: uid);
                                  },
                                ),
                              ],
                            ),
                          ),
                          const ReviewContainer(),
                          SpacerV(value: Dimens.space36)
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
