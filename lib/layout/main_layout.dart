import 'package:lingerie_store_project/layout/colors.dart';
import 'package:lingerie_store_project/ui/widgets/home/button_navigation_bar.dart';
import 'package:lingerie_store_project/ui/widgets/home/floating_action_button.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child; // The screen that will be shown inside
  // final int currentIndex;
  // final Function(int) onTap;

  const MainLayout({
    super.key,
    required this.child,
    // required this.currentIndex,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(BrandColors.appBarColor.value),
        centerTitle: true,
        title: Text('Velora Lingerie Shop'),
      ),
      body: child,
      bottomNavigationBar: homeButtonNavigationBar(context),
      // floatingActionButton: homeFloatingActionButton(
      //     context, BrandColors.brandPastelPurple2.value),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
