import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/animations/fade_in.dart';
import 'package:lingerie_store_project/controllers/signup.dart';
import 'package:lingerie_store_project/widgets/signup/bottom_bar.dart';
import 'package:lingerie_store_project/widgets/signup/progress_bar.dart';

// class SignupPage extends StatelessWidget {
class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final ProgressController controller = Get.put(ProgressController());
    return GetBuilder<ProgressController>(
        init: ProgressController(),
        builder: (controller) => Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              toolbarHeight: 1,
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProgressBar(
                    controller: controller,
                  ),
                  Expanded(
                      child: PageView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          controller: controller.pageController,
                          itemCount: controller.pages.length,
                          itemBuilder: (context, index) {
                            return FadeInAnimation(
                                milliseconds: 500,
                                child: RepaintBoundary(
                                    child: controller.pages[index]));
                          })),
                  BottomBar(
                    controller: controller,
                  )
                ])));
  }
}
