import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/pages/cart.dart';
// import 'package:lingerie_store_project/pages/homepage.dart';
import 'package:lingerie_store_project/pages/products.dart';
import 'package:lingerie_store_project/pages/profile.dart';

class MainLayoutController extends GetxController {
  var selectedIndex = 0.obs;
  final PageController pageController = PageController();
  static MainLayoutController get init => Get.put(MainLayoutController());

  final List<Widget> pages = [
    // HomePage(),
    ProductsPage(),
    ProductsCartPage(),
    ProfilePage(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
    // update();
  }

  @override
  void onClose() {
    pageController.dispose(); // Evita fugas de memoria
    super.onClose();
  }
}
