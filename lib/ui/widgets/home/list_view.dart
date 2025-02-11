import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/ui/widgets/product_card.dart';

Widget customListView(BuildContext context, List<ProductModel> products) {
  return GridView.builder(
      // Adds padding around the entire ListView.
      padding: EdgeInsets.all(5.0),
      // Sets the scroll direction. Use Axis.horizontal for horizontal scrolling.
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(context), // Two columns
        crossAxisSpacing: 10, // Space between columns
        mainAxisSpacing: 5.0, // Space between rows
        childAspectRatio: 0.8, // Adjust height-to-width ratio
      ),
      itemCount: products.length,
      itemBuilder: (context, index) =>
          ProductCard(product: products[index]).build(context));
}

int getCrossAxisCount(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  switch (screenWidth) {
    case < 600:
      return 2;
    case < 900:
      return 3;
    default:
      return 8;
  }
}
