import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/animations/fade_in.dart';
import 'package:lingerie_store_project/controllers/signup.dart';
import 'package:lingerie_store_project/widgets/signup/animated_background.dart';
import 'package:lingerie_store_project/widgets/signup/bottom_bar.dart';
import 'package:lingerie_store_project/widgets/signup/progress_bar.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserDataSignupController());
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return GetBuilder<ProgressController>(
      init: ProgressController(),
      builder: (controller) => Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child:
                  AnimatedBackground(), // Asegura que el fondo cubra toda la pantalla
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProgressBar(controller: controller),
                Expanded(
                  // Se agrega Expanded para restringir el tamaño
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    itemCount: controller.pages.length,
                    itemBuilder: (context, index) {
                      return FadeInAnimation(
                        milliseconds: 500,
                        child: Center(
                          child: controller.pages[index],
                        ),
                      );
                    },
                  ),
                ),
                BottomBar(controller: controller)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
