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
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(8.0), // Adjust the corner radius
      // ),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Less rounded, more angled
      ),
      shadowColor: Color(0xFFC4D9FF),
      color: Color(0xFFE8F9FF),
      borderOnForeground: false,
      // margin: EdgeInsets.only(bottom: 0.0), // No requiere margin interno ya que la propia lista está aplicando márgenes
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Para darle acciones al tocar la foto, un toque, o pulsación larga.
            GestureDetector(
                onTap: () => log('Clicked ${product.productName}'),
                child: SizedBox(
                  height: _getHeight(context),
                  child: Builder(
                    builder: (context) {
                      return RawGestureDetector(gestures: {
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
                      }, child: _image(context, product.productImagePath));
                    },
                  ),
                )),
            Row(
              children: [
                // Aquí es mejor usar Expanded para asignar el ancho (width) a los elementos y que lo compartan, y no tener que hacerlo manual y se superpongan
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    product.productName,
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                  // ),
                ),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    '\$${product.price.toString()}',
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => log('Added ${product.productName} to cart'),
                ),
              ],
            )
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
      return 200;
    case < 900:
      return 210;
    default:
      return 215;
  }
}

Widget _image(BuildContext context, imagePath) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.network(
      imagePath,
      height: _getHeight(context),
      width: double.infinity,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
    ),
  );
}
