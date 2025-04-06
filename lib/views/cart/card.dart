import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/utils/images/load_image.dart';
import 'package:lingerie_store_project/utils/images/zoomable_image.dart';
import 'package:lingerie_store_project/widgets/buttons/extended.dart';

class CartCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onPressed;
  final String buttonLabel;
  const CartCard(
      {super.key,
      required this.product,
      required this.onPressed,
      required this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    ImageLoader imageLoaded = ImageLoader(
      imagePath: product.productImagePath,
      height: 150,
      width: 150,
    );
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Less rounded, more angled
      ),
      elevation: 1,
      borderOnForeground: false,
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Para darle acciones al tocar la foto, un toque, o pulsación larga.
              GestureDetector(
                  onTap: () => log('Clicked ${product.productName}'),
                  onLongPress: () {
                    log('Long Pressed ${product.productName}');
                    showZoomableImage(context, imageLoaded);
                  },
                  child: imageLoaded),
              Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    '\$${product.price.toString()}',
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    product.productName,
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                  ExtendedButton(
                    buttonLabel: buttonLabel,
                    onPressed: onPressed,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
