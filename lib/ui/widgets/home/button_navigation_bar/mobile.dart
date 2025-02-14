import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/colors.dart';

Widget mobileButtonNavigationBar(BuildContext context) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    color: Color(BrandColors.appBarColor.value),
    notchMargin: 6.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            icon: Icon(Icons.home_rounded),
            onPressed: () {
              log('Button pressed: home');
              Navigator.pushNamed(context, '/Home');
            }),
        IconButton(
            icon: Icon(Icons.shopping_bag_rounded),
            onPressed: () {
              log('button pressed');
              Navigator.pushNamed(context, '/Products');
            }),
        IconButton(icon: Icon(Icons.shopping_cart_rounded), onPressed: () {}),
        IconButton(icon: Icon(Icons.person_2_rounded), onPressed: () {}),
      ],
    ),
  );
}
