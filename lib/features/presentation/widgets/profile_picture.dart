import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.pictureUrl,
    required this.onTap,
    required this.radius,
    this.border,
  });

  final String pictureUrl;
  final Function() onTap;
  final double radius;
  final double? border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100.r),
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).hintColor,
        radius: border != null ? radius + border! : radius + Dimens.space4,
        child: CircleAvatar(
          backgroundColor: Theme.of(context).hintColor,
          backgroundImage: CachedNetworkImageProvider(pictureUrl),
          radius: radius,
        ),
      ),
    );
  }
}
