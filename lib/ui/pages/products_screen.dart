import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/colors.dart';
import 'package:lingerie_store_project/layout/main_layout.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/ui/widgets/home/list_view.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return MainLayout(child: productsView(context));
    return Container(
      // color en hex siempre es 0xff + hex
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(BrandColors.brandPastelPurple1.value),
            Color(BrandColors.brandPastelBlue.value)
          ])),
      child: customListView(context, products),
    );
  }
}

Widget productsView(BuildContext context) {
  return Container(
    // color en hex siempre es 0xff + hex
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
          Color(BrandColors.brandPastelPurple1.value),
          Color(BrandColors.brandPastelBlue.value)
        ])),
    child: customListView(context, products),
  );
}
