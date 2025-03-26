import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/utils/images/load_image.dart';
import 'package:lingerie_store_project/utils/images/zoomable_image.dart';
import 'package:lingerie_store_project/widgets/buttons/peek.dart';
import 'package:lingerie_store_project/widgets/buttons/simplified_add_to_cart.dart';

/// Crea las [Card]s de cada producto.
/// Las tarjetas en sí no cambian, su diseño es estático
class ProductCardListView extends StatelessWidget {
  final ProductModel product;

  const ProductCardListView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    ImageLoader imageWidget = ImageLoader(
      imagePath: product.productImagePath,
      width: 130,
      height: 140,
    );

    return Card(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          spacing: 40,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Para darle acciones al tocar la foto, un toque, o pulsación larga.
            GestureDetector(
              onTap: () => log('Clicked ${product.productName}'),
              onLongPress: () {
                log('Long Pressed ${product.productName}');
                showZoomableImage(context, imageWidget);
              },
              child: imageWidget,
            ),

            /// Para la [ListView] No se debe usar Expanded, en su lugar se coloca una [Column]
            /// Y se agregan los elementos necesarios.
            Column(
              spacing: 10,
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
                Row(
                  spacing: 14,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PeekButton(imageWidget: imageWidget),
                    SimplifiedAddToCart(product: product),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
