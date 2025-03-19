import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lingerie_store_project/utils/colors.dart';
import 'package:lingerie_store_project/utils/images/mediaquery_measures.dart';

class ImageLoader extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;

  const ImageLoader(
      {super.key, required this.imagePath, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.cover,
        height: height ?? getHeight(context),
        width: width ?? getWidth(context),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Transform.scale(
            scale: 0.4,
            child: CircularProgressIndicator(
              color: BrandColors.pastelPurple.value,
            )),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
