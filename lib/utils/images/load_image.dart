import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/colors.dart';
import 'package:lingerie_store_project/utils/images/mediaquery_measures.dart';

class ImageLoader extends StatefulWidget {
  final String imagePath;
  final double? height;
  final double? width;

  const ImageLoader(
      {super.key, required this.imagePath, this.height, this.width});
  @override
  State<ImageLoader> createState() => _ImageLoader();
}

class _ImageLoader extends State<ImageLoader> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: widget.imagePath,
        fit: BoxFit.cover,
        height: widget.height ?? getWidth(context),
        width: widget.width ?? getHeight(context),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
            ),
          ),
        ),
        placeholder: (context, url) => Transform.scale(
            scale: 0.5, // scale down to 50% of its original size
            child: CircularProgressIndicator(
              color: BrandColors.pastelPurple.value,
            )),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
