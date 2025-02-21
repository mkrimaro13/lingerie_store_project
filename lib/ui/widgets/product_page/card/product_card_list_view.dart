import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lingerie_store_project/utils/colors.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/utils/images/load_image.dart';
import 'package:lingerie_store_project/utils/images/mediaquery_measures.dart';
import 'package:lingerie_store_project/utils/images/zoomable_image.dart';

/// Crea las [Card]s de cada producto.
/// Las tarjetas en sí no cambian, su diseño es estático
class ProductCardListView extends StatefulWidget {
  final ProductModel product;

  const ProductCardListView({super.key, required this.product});
  @override
  State<ProductCardListView> createState() => _ProductCardListView();
}

class _ProductCardListView extends State<ProductCardListView> {
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
            spacing: getSpacing(context),
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Para darle acciones al tocar la foto, un toque, o pulsación larga.
              GestureDetector(
                  onTap: () => log('Clicked ${widget.product.productName}'),
                  onLongPress: () {
                    log('Long Pressed ${widget.product.productName}');
                    showZoomableImage(context, widget.product.productName,
                        widget.product.productImagePath);
                  },
                  child: ImageLoader(
                    imagePath: widget.product.productImagePath,
                  )),

              /// Para la [ListView] No se debe usar Expanded, en su lugar se coloca una [Column]
              /// Y se agregan los elementos necesarios.
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    widget.product.productName,
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    '\$${widget.product.price.toString()}',
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
                        log('Added ${widget.product.productName} to cart'),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
