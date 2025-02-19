import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/colors.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/utils/zoomable_image.dart';

/// Crea las [Card]s de cada producto.
/// Las tarjetas en sí no cambian, su diseño es estático
class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Less rounded, more angled
      ),
      elevation: 1,
      shadowColor: BrandColors.pastelPurple.value,
      // color: Color(0xFFE5D9F2),
      borderOnForeground: false,
      // margin: EdgeInsets.only(bottom: 0.0), // No requiere margin interno ya que la propia lista está aplicando márgenes
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: 1,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Para darle acciones al tocar la foto, un toque, o pulsación larga.
            GestureDetector(
                onTap: () => log('Clicked ${product.productName}'),
                onLongPress: () {
                  log('Long Pressed ${product.productName}');
                  showZoomableImage(
                      context, product.productName, product.productImagePath);
                },
                child: _image(context, product.productImagePath)),
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

  double _getHeight(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    switch (screenWidth) {
      case < 370:
        return 170;
      case < 400:
        return 190;
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
}
