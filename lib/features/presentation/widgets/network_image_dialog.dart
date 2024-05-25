import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageDialog extends StatelessWidget {
  const NetworkImageDialog({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [CachedNetworkImage(imageUrl: image)],
      ),
    );
  }
}
