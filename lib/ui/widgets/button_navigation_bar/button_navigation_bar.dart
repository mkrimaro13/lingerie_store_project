import 'package:flutter/material.dart';
import 'package:lingerie_store_project/ui/widgets/button_navigation_bar/mobile.dart';
class MainButtonNavigationBar extends StatelessWidget{
  const MainButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    switch (screenWidth) {
      case < 600:
        return MobileButtonNavigationBar();
      // case < 900:
      //   return;
      default:
        return MobileButtonNavigationBar();
    }
  }
}