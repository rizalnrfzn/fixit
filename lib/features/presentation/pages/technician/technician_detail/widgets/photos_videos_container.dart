import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotosVideosContainer extends StatelessWidget {
  const PhotosVideosContainer({
    super.key,
    required this.picture,
  });

  final List<String> picture;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.space6),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: SizedBox(
                  height: 300.w,
                  width: 182.5.w,
                  child: CachedNetworkImage(
                    imageUrl: picture[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: SizedBox(
                      height: 144.w,
                      width: 182.5.w,
                      child: CachedNetworkImage(
                        imageUrl: picture[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.w),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: SizedBox(
                      height: 144.w,
                      width: 182.5.w,
                      child: CachedNetworkImage(
                        imageUrl: picture[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.space6),
          child: Row(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: SizedBox(
                      height: 144.w,
                      width: 182.5.w,
                      child: CachedNetworkImage(
                        imageUrl: picture[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.w),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: SizedBox(
                      height: 144.w,
                      width: 182.5.w,
                      child: CachedNetworkImage(
                        imageUrl: picture[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: SizedBox(
                  height: 300.w,
                  width: 182.5.w,
                  child: CachedNetworkImage(
                    imageUrl: picture[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
