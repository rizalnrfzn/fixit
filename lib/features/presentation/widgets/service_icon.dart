import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ServiceIcon extends StatelessWidget {
  const ServiceIcon({
    super.key,
    required this.index,
    required this.electronic,
  });

  final int index;
  final Electronic electronic;

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Theme.of(context).extension<MyAppColors>()!.blue!,
      Theme.of(context).extension<MyAppColors>()!.flamingo!,
      Theme.of(context).extension<MyAppColors>()!.green!,
      Theme.of(context).extension<MyAppColors>()!.maroon!,
      Theme.of(context).extension<MyAppColors>()!.mauve!,
      Theme.of(context).extension<MyAppColors>()!.teal!,
      Theme.of(context).extension<MyAppColors>()!.pink!,
      Theme.of(context).extension<MyAppColors>()!.lavender!,
    ];

    return InkWell(
      onTap: () {
        if (electronic.id == 'wzicVyX1YzsQfn9cmAaq') {
          context.push(Routes.allService.path);
        } else {
          context.push(Routes.technicianList.path, extra: electronic.id);
        }
      },
      borderRadius: BorderRadius.circular(Dimens.space20),
      child: Column(
        children: [
          Container(
            height: 55.w,
            width: 55.w,
            decoration: BoxDecoration(
              color: colors[index].withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(Dimens.space16),
            child: CachedNetworkImage(
              imageUrl: electronic.image!,
              color: colors[index],
            ),
          ),
          SpacerV(value: Dimens.space6),
          Text(
            (MainBoxMixin.mainBox?.get(MainBoxKeys.locale.name) as String? ??
                        'en') ==
                    'en'
                ? electronic.englishName!
                : electronic.name!,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w400, height: 1.2),
          ),
        ],
      ),
    );
  }
}
