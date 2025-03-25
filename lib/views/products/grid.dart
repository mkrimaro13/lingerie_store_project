import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/utils/mediaquery_measures.dart';
import 'package:lingerie_store_project/views/products/cards/grid.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    // El builder sirve para cargar elementos de forma dinámica, será útil para integrar el API, si se carga solo.
    // GridView() es para manejar elementos estáticos.
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(8.0),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(context), // Cantidad de columnas
        crossAxisSpacing: 2, // Espacio entre columnas
        mainAxisSpacing: 2, // Espacio entre filas
        childAspectRatio: 0.57, // Ajusta la relación Alto-Ancho
      ),
      itemCount: products.length, // Cantidad de elementos a cargar.
      itemBuilder: (context, index) =>

          /// Llama al objeto que crea las tarjetas de cada producto.
          ProductCardGridView(product: products[index]),
    );
  }
}
