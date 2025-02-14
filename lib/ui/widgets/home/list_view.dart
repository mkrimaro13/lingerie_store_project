import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/ui/widgets/product_card.dart';

Widget customListView(BuildContext context, List<ProductModel> products) {
  return GridView.builder(
      physics: BouncingScrollPhysics(),
      // Adds padding around the entire ListView.
      padding: EdgeInsets.all(8.0),
      // Sets the scroll direction. Use Axis.horizontal for horizontal scrolling.
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(context), // Two columns
        crossAxisSpacing: 2, // Space between columns
        mainAxisSpacing: 2, // Space between rows
        childAspectRatio: 0.7, // Adjust height-to-width ratio
      ),
      itemCount: products.length,
      itemBuilder: (context, index) =>
          ProductCard(product: products[index]).build(context));
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const AlwaysScrollableScrollPhysics()
        .applyTo(const BouncingScrollPhysics()); // Custom physics
  }
}

int _getCrossAxisCount(BuildContext context) {
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

int _getCrossAxisSpacing(BuildContext context) {
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

int _getMainAxisSpacing(BuildContext context) {
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
