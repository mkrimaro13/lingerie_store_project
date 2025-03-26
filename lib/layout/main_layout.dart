import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/animations/fade_in.dart';
import 'package:lingerie_store_project/controllers/main_layout.dart';
import 'package:lingerie_store_project/layout/background.dart';
import 'package:lingerie_store_project/widgets/main_layout/bottom_navigation_bar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});
  @override
  Widget build(BuildContext context) {
    final MainLayoutController controller = Get.put(MainLayoutController());
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, toolbarHeight: 1),
      body: PageView.builder(
        controller: controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.pages.length,
        itemBuilder: (context, index) {
          return FadeInAnimation(
            milliseconds: 500,
            child: RepaintBoundary(
                child: SpecialBackground(child: controller.pages[index])),
          );
        },
      ),

      ///Para habilitar la actualización de la barra inferior
      ///Se debe establecer el `observador` en todo el Widget, ya que el
      ///widget depende tanto del valor de `selectIndex`, como de la
      ///función `onItemTapped` que internamente actualiza `update()` su
      ///valor.
      ///`update()` envía la señal para repintar el Widget
      bottomNavigationBar: Obx(
        () => CustomBottomNavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onItemTapped: controller.onItemTapped,
        ),
      ),
    );
  }
}
