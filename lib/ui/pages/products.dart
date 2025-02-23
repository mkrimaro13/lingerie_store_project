import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/ui/widgets/product_page/products_grid_view.dart';
import 'package:lingerie_store_project/ui/widgets/product_page/products_list_view.dart';
import 'package:lingerie_store_project/utils/colors.dart';
import 'package:lingerie_store_project/utils/images/mediaquery_measures.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = kMinInteractiveDimension;
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: getPadding(context)),
      child: Stack(
        children: [
          /// Se establece primero la vista principal de los productos, y
          /// se le asigna un espacio en la parte superior para establecer
          /// la barra superior.
          Positioned.fill(
            top: appBarHeight,
            child: _isGridView
                ? ProductsGridView(products: products)
                : ProductsListView(products: products),
          ),
          Container(
            height: appBarHeight,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: BrandColors.whitePurple.value,
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  tooltip: 'Ordenar los productos',
                  onPressed: () {},
                  icon: const Icon(Icons.sort_rounded),
                ),
                Row(
                  children: [
                    IconButton(
                      tooltip: 'Filtrar los productos',
                      icon: const Icon(Icons.filter_list_rounded),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => Container(
                            padding: const EdgeInsets.all(16),
                            child: const Text('Filter options here'),
                          ),
                        );
                      },
                    ),
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
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
