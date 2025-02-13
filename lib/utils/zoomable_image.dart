import 'dart:developer';

import 'package:flutter/material.dart';

class ZoomableImageState extends State<ZoomableImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300), // Animation duration
    );
    _animation = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward(); // Start animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: InteractiveViewer(
        panEnabled: true,
        minScale: 1.0, // Zoom mínimo, por defecto al hacer zoom.
        maxScale:
            2.0, // Zoom máximo, cuando se hace zoom, se puede seguir haciendo un "pequeño" zoom, que es esta escala adicional.
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(widget.imageUrl),
        ),
      ),
    );
  }
}

// Widget for the zoom animation
class ZoomableImage extends StatefulWidget {
  final String imageUrl;
  final String productName;
  const ZoomableImage(
      {super.key, required this.productName, required this.imageUrl});

  @override
  ZoomableImageState createState() => ZoomableImageState();
}

// Function to show zoomable image with animation
void showZoomableImage(
    BuildContext context, String productName, String imageUrl) {
  log('Zooming $productName');
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: ZoomableImage(productName: productName, imageUrl: imageUrl),
    ),
  );
}
