import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/views/products/cards/list.dart';

class ProductsListView extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(8.0),
      itemCount: products.length,
      itemBuilder: (context, index) =>

          /// Llama al objeto que crea las tarjetas de cada producto.
          ProductCardListView(product: products[index]),
    );
  }
}
