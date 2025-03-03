import 'package:flutter/material.dart';
import 'package:lingerie_store_project/utils/colors.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/ui/widgets/product_page/products_grid_view.dart';
import 'package:lingerie_store_project/ui/widgets/product_page/products_list_view.dart';

/// Vista dinámica que muestra la lista de los productos disponibles.
/// Se puede cambiar entre [GridView] y [ListView] para mostrarlo como cuadrícula
/// o como lista respectivamente.
/// A futuro tendrá las funciones de filtrado y reorganización.
/// Se realiza el cambio a [Scaffold] para contar con un [AppBar] adicional que cuente
/// con las funciones adicionales necesarias.
class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPage();
}

class _ProductsPage extends State<ProductsPage> {
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    /// Se cambia a un Scaffold para poder utilizar
    /// el AppBar y crear las opciones necesarias.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.transparent.value,
        leading: IconButton(
            tooltip: 'Ordenar los productos',
            onPressed: () {},
            icon: Icon(Icons.sort_rounded)),
        actions: [
          IconButton(
            tooltip: 'Filtrar los productos',
            icon: Icon(Icons.filter_list_rounded),
            onPressed: () {
              /// Filtros
              showModalBottomSheet(
                context: context,
                builder: (_) => Container(
                  padding: EdgeInsets.all(16),
                  child: Text('Filter options here'),
                ),
              );
            },
          ),

          /// Botón para el cambio de icono según la vista seleccionada
          IconButton(
            tooltip: 'Cambiar la vista',
            icon: Icon(_isGridView
                ? Icons.view_list_rounded
                : Icons.grid_view_rounded),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      /// Cambio de vista.
      body: _isGridView
          ? ProductsGridView(products: products)
          : ProductsListView(products: products),
    );
  }
}
