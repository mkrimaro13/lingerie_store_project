import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/ui/widgets/product_page/card/product_card_grid_view.dart';
import 'package:lingerie_store_project/utils/animations/fade_in.dart';

class ProductsGridView extends StatefulWidget {
  final List<ProductModel> products;
  const ProductsGridView({
    super.key,
    required this.products,
  });

  @override
  State<ProductsGridView> createState() => _ProductsGridView();
}

class _ProductsGridView extends State<ProductsGridView> {
  // void _toggle(int index) {
  //   if (widget.isSelectionMode) {
  //     setState(() {
  //       widget.selectedList[index] = !widget.selectedList[index];
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // El builder sirve para cargar elementos de forma dinámica, será útil para integrar el API, si se carga solo.
    // GridView() es para manejar elementos estáticos.
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(8.0),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getCrossAxisCount(context), // Cantidad de columnas
          crossAxisSpacing: 2, // Espacio entre columnas
          mainAxisSpacing: 2, // Espacio entre filas
          childAspectRatio: 0.7, // Ajusta la relación Alto-Ancho
        ),
        itemCount: products.length, // Cantidad de elementos a cargar.
        itemBuilder: (context, index) =>

            /// Función que itera sobre cada elemento
            /// Aplica una animación de aparición gradual o desvanecimiento de entrada
            /// a su [Widget] hijo.
            FadeInAnimation(
              milliseconds: 1000,
              child: SizedBox(
                  height: double.infinity,

                  /// Llama al objeto que crea las tarjetas de cada producto.
                  child: ProductCardGridView(product: products[index])),
            ));
  }
}

int _getCrossAxisCount(BuildContext context) {
  //De acuerdo al tamaño de pantalla.
  double screenWidth = MediaQuery.sizeOf(context).width;

  switch (screenWidth) {
    case < 600:
      return 2;
    case < 900:
      return 3;
    default:
      return 4;
  }
}
