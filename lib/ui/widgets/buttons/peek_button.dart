import 'package:flutter/material.dart';
import 'package:lingerie_store_project/utils/images/load_image.dart';
import 'package:lingerie_store_project/utils/images/zoomable_image.dart';

class PeekButton extends StatefulWidget {
  final ImageLoader imageWidget;
  const PeekButton({super.key, required this.imageWidget});

  @override
  State<PeekButton> createState() => _PeekButton();
}

class _PeekButton extends State<PeekButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(20, 40),
      ),
      onPressed: () => showZoomableImage(context, widget.imageWidget),
      child: Icon(Icons.remove_red_eye_rounded),
    );
  }
}
