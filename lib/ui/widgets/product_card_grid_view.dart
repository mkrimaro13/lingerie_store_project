import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/colors.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/utils/zoomable_image.dart';

/// Crea las [Card]s de cada producto.
/// Las tarjetas en sí no cambian, su diseño es estático
class ProductCardGridView extends StatefulWidget {
  final ProductModel product;

  const ProductCardGridView({super.key, required this.product});

  @override
  State<StatefulWidget> createState() => _ProductCardGridView();
}

class _ProductCardGridView extends State<ProductCardGridView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 1,
      shadowColor: BrandColors.pastelPurple.value,
      borderOnForeground: false,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: _getSpacing(context),
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Para darle acciones al tocar la foto, un toque, o pulsación larga.
            GestureDetector(
                onTap: () => log('Clicked ${widget.product.productName}'),
                onLongPress: () {
                  log('Long Pressed ${widget.product.productName}');
                  showZoomableImage(context, widget.product.productName,
                      widget.product.productImagePath);
                },
                child: _image(context, widget.product.productImagePath)),
            Row(
              children: [
                // Aquí es mejor usar Expanded para asignar el ancho (width) a los elementos y que lo compartan, y no tener que hacerlo manual y se superpongan
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.product.productName,
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
                    '\$${widget.product.price.toString()}',
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                ),
                IconButton(
                    onPressed: () =>
                        log('Added ${widget.product.productName} to cart'),
                    icon: Icon(Icons.add_shopping_cart_rounded))
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Método para calcular el alto de acuerdo al ancho de la pantalla del contexto.
  double _getHeight(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    switch (screenWidth) {
      case <= 370:
        return 160;
      case <= 400:
        return 170;
      case <= 500:
        return 190;
      case <= 800:
        return 220;
      case <= 900:
        return 210;
      default:
        return 215;
    }
  }

  /// Método para calcular el espaciado de acuerdo al ancho de la pantalla del contexto.
  double _getSpacing(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    switch (screenWidth) {
      case <= 370:
        return 5;
      case <= 400:
        return 8;
      case <= 800:
        return 20;
      default:
        return 10;
    }
  }

  /// Método para cargar la imagen y darle medidas personalizadas
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
