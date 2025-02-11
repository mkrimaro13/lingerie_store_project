import 'package:flutter/material.dart';
import 'package:lingerie_store_project/ui/widgets/home/button_navigation_bar/mobile.dart';

Widget homeButtonNavigationBar(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  switch (screenWidth) {
    case < 600:
      return mobileButtonNavigationBar(context);
    // case < 900:
    //   return;
    default:
      return mobileButtonNavigationBar(context);
  }
}
