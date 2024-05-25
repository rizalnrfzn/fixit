import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/presentation/widgets/network_image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotosVideosContainer extends StatelessWidget {
  const PhotosVideosContainer({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimens.space8),
          padding: EdgeInsets.all(Dimens.space8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Theme.of(context).hintColor.withOpacity(0.3),
          ),
          child: StaggeredGrid.count(
            crossAxisCount: images.length > 2 ? 2 : images.length,
            crossAxisSpacing: Dimens.space8,
            mainAxisSpacing: Dimens.space8,
            children: List.generate(
              images.length,
              (index) => StaggeredGridTile.fit(
                crossAxisCellCount: 1,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () {
                    showAdaptiveDialog(
                      context: context,
                      builder: (_) => NetworkImageDialog(
                        image: images[index],
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: SizedBox(
                      child: CachedNetworkImage(
                        imageUrl: images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
