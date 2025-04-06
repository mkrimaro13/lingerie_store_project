import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/controllers/cart.dart';
import 'package:lingerie_store_project/models/product_model.dart';

class SimplifiedAddToCart extends StatelessWidget {
  final ProductModel product;
  const SimplifiedAddToCart({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.snackbar("Agregado al carrito 👜", "Allí te espera 👙");
        CartController.to.addProduct(product);
      },
      child: Icon(
        Icons.shopping_bag_rounded,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
