import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/utils/zoomable_image.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE8F9FF),
      margin: EdgeInsets.only(bottom: 5.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => log('Clicked ${product.productName}'),
              child: Builder(
                builder: (context) {
                  return RawGestureDetector(
                    gestures: {
                      LongPressGestureRecognizer:
                          GestureRecognizerFactoryWithHandlers<
                              LongPressGestureRecognizer>(
                        () => LongPressGestureRecognizer(
                            duration: Duration(
                                milliseconds:
                                    200)), // Demora para hacer el Zoom
                        (LongPressGestureRecognizer instance) {
                          instance.onLongPress = () {
                            log('Long Pressed ${product.productName}');
                            showZoomableImage(context, product.productName,
                                product.productImagePath);
                          };
                        },
                      ),
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        product.productImagePath,
                        height: _getHeight(context),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '${product.productName}\n\$${product.price}',
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => log('Added ${product.productName} to cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

double _getHeight(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  switch (screenWidth) {
    case < 600:
      return 160;
    case < 900:
      return 210;
    default:
      return 215;
  }
}
