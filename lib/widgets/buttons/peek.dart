import 'package:flutter/material.dart';
import 'package:lingerie_store_project/utils/images/load_image.dart';
import 'package:lingerie_store_project/utils/images/zoomable_image.dart';

class PeekButton extends StatelessWidget {
  final ImageLoader imageWidget;
  const PeekButton({super.key, required this.imageWidget});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showZoomableImage(context, imageWidget),
      child: Icon(
        Icons.remove_red_eye_rounded,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
