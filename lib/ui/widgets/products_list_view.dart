import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/ui/widgets/product_card_list_view.dart';
import 'package:lingerie_store_project/utils/animations/fade_in.dart';

class ProductsListView extends StatefulWidget {
  final List<ProductModel> products;
  const ProductsListView({
    super.key,
    required this.products,
  });
  @override
  State<ProductsListView> createState() => _ProductsListView();
}

class _ProductsListView extends State<ProductsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) =>

            /// Función que itera sobre cada elemento
            /// Aplica una animación de aparición gradual o desvanecimiento de entrada
            /// a su [Widget] hijo.
            FadeInAnimation(
              milliseconds: 1000,
              child: SizedBox(
                  width: double.infinity,

                  /// Llama al objeto que crea las tarjetas de cada producto.
                  child: ProductCardListView(product: widget.products[index])),
            ));
  }
}
