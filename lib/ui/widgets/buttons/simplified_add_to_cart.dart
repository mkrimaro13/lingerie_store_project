import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/ui/widgets/cart_page/cart_provider.dart';

class SimplifiedAddToCart extends StatefulWidget {
  final ProductModel product;
  const SimplifiedAddToCart({super.key, required this.product});

  @override
  State<SimplifiedAddToCart> createState() => _CustomButtonAddToCart();
}

class _CustomButtonAddToCart extends State<SimplifiedAddToCart> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(20, 40),
      ),
      onPressed: () {
        CartController.to.addProduct(widget.product);
      },
      child: Icon(Icons.shopping_bag_rounded),
    );
  }
}
