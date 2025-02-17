import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/ui/widgets/list_view.dart';

/// Aunque gestiona una lista dinámica no es necesario que la vista de la pantalla cambie.
/// Ya que este Widget solamente brinda la abstracción del estilo y [Material] para poder
/// Aplicarle la animación mas fácil (también se puede hace con container, pero me pareció mas extenso)
class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ProductsGridView(products: products),
    );
  }
}
