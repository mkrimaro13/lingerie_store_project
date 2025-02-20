import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/colors.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/utils/zoomable_image.dart';

/// Crea las [Card]s de cada producto.
/// Las tarjetas en sí no cambian, su diseño es estático
class ProductCardListView extends StatelessWidget {
  final ProductModel product;

  const ProductCardListView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Less rounded, more angled
      ),
      elevation: 1,
      shadowColor: BrandColors.pastelPurple.value,
      borderOnForeground: false,
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            spacing: _getSpacing(context),
            mainAxisAlignment: MainAxisAlignment.start,
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

              /// Para la [ListView] No se debe usar Expanded, en su lugar se coloca una [Column]
              /// Y se agregan los elementos necesarios.
              // SizedBox(
              //   width: 50,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    product.productName,
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    '\$${product.price.toString()}',
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(20, 40),
                        backgroundColor: BrandColors.whitePurple.value,
                        foregroundColor: Color(0xFF1A1A1D)),
                    child: Text('Agregar al carrito'),
                    onPressed: () =>
                        log('Added ${product.productName} to cart'),
                  ),
                ],
              )
            ],
          )),
    );
  }

  double _getWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    switch (screenWidth) {
      case < 370:
        return 130;
      case < 400:
        return 150;
      case < 600:
        return 160;
      case < 700:
        return 200;
      case < 800:
        return 250;
      case < 900:
        return 190;
      default:
        return 215;
    }
  }

  double _getSpacing(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    switch (screenWidth) {
      case < 370:
        return 5;
      case < 400:
        return 10;
      case < 500:
        return 15;
      case < 600:
        return 10;
      case < 700:
        return 100;
      case < 800:
        return 150;
      case < 900:
        return 200;
      default:
        return 50;
    }
  }

  Widget _image(BuildContext context, imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        imagePath,
        height: 160,
        width: _getWidth(context),
        // height: double.infinity,
        // width: _getWidth(context),
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
