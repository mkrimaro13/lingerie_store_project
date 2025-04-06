import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/controllers/signup.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final BackgroundAnimationController controller = Get.put(BackgroundAnimationController());

    return AnimatedBuilder(
      animation: controller.animation,
      builder: (context, child) {
        return Transform.translate(
          offset: controller.animation.value,
          child: Image.asset(
            'lib/images/backgrounds/signup-background.webp',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
