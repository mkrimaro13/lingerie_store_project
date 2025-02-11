import 'package:flutter/material.dart';

Widget mobileButtonNavigationBar(BuildContext context) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    notchMargin: 8.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(icon: Icon(Icons.home), onPressed: () {}),
        IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
        SizedBox(width: 40), // Space for FAB
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        IconButton(icon: Icon(Icons.person), onPressed: () {}),
      ],
    ),
  );
}
