import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/colors.dart';

class MobileButtonNavigationBar extends StatelessWidget{
  const MobileButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                log('Home button pressed');
                Navigator.pushNamed(
                  context,
                  '/Home',
                );
              }),
          IconButton(icon: Icon(Icons.favorite_rounded), onPressed: () {}),
          SizedBox(width: 40), // Space for FAB
          IconButton(icon: Icon(Icons.shopping_cart_rounded), onPressed: () {}),
          IconButton(icon: Icon(Icons.person_2), onPressed: () {}),
        ],
      ),
    );
  }
}