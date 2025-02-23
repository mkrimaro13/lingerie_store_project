import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lingerie_store_project/ui/widgets/buttons/simplified_add_to_cart.dart';
import 'package:lingerie_store_project/utils/colors.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/utils/images/load_image.dart';
import 'package:lingerie_store_project/utils/images/mediaquery_measures.dart';
import 'package:lingerie_store_project/utils/images/zoomable_image.dart';

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
    final imageWidget = ImageLoader(
      imagePath: widget.product.productImagePath,
    );
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 1,
      shadowColor: BrandColors.whitePurple.value,
      borderOnForeground: false,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: getSpacing(context),
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Para darle acciones al tocar la foto, un toque, o pulsación larga.
            GestureDetector(
              onTap: () => log('Clicked ${widget.product.productName}'),
              onLongPress: () {
                log('Long Pressed ${widget.product.productName}');
                showZoomableImage(context, imageWidget);
              },
              child: imageWidget,
            ),

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
                SimplifiedAddToCart()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
