import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/utils/colors.dart';

class SimplifiedAddToCart extends StatefulWidget {
  final VoidCallback? onPressed;
  final ProductModel? product;
  const SimplifiedAddToCart({super.key, this.onPressed, this.product});

  @override
  State<SimplifiedAddToCart> createState() => _CustomButtonAddToCart();
}

class _CustomButtonAddToCart extends State<SimplifiedAddToCart> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          color: BrandColors.whitePurple.value),
      child: IconButton(
          onPressed: widget.onPressed ??
              () => log('Button Simplified Add To cart pressed'),
          icon: Icon(Icons.add_shopping_cart_rounded)),
    );
  }
}
