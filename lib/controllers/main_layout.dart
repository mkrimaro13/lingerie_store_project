import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/pages/cart.dart';
// import 'package:lingerie_store_project/pages/homepage.dart';
import 'package:lingerie_store_project/pages/products.dart';
import 'package:lingerie_store_project/pages/profile.dart';

class MainLayoutController extends GetxController {
  late final PageController pageController;
  var selectedIndex = 0.obs;
  final int initialIndex;

  final List<Widget> pages = [
    ProductsPage(),
    ProductsCartPage(),
    ProfilePage(),
  ];

  MainLayoutController({this.initialIndex = 0});

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = initialIndex;
    pageController = PageController(initialPage: initialIndex);
    pageController.addListener(() {
      final currentPage = pageController.page?.round() ?? 0;
      if (selectedIndex.value != currentPage) {
        selectedIndex.value = currentPage;
      }
    });
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
