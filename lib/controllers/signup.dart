import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/views/signup/personal_data.dart';
import 'package:lingerie_store_project/views/signup/contact_information.dart';
import 'package:lingerie_store_project/views/signup/preferences.dart';
import 'package:lingerie_store_project/views/signup/term.dart';

class ProgressController extends GetxController {
  var progress = 0.25.obs; // Observa cambios en el progreso
  var index = 0.obs;

  final PageController pageController = PageController();
  static ProgressController get init => Get.put(ProgressController());
  final List<Widget> pages = [
    PreferencesView(),
    PersonalDataView(),
    ContactInformationView(),
    TermsView(),
  ];

  // Actualiza el progreso de la barra superior y de la parte inferior de los íconos.
  void updateProgress(int selectedIndex) {
    if (index.value < selectedIndex) {
      progress.value =
          (progress.value + 0.25 * (selectedIndex - index.value).abs())
              .clamp(0.0, 1);
    } else if (index.value > selectedIndex) {
      progress.value =
          (progress.value - 0.25 * (selectedIndex - index.value).abs())
              .clamp(0.0, 1);
    }

    pageController.animateToPage(
      selectedIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    index.value = selectedIndex; // Actualiza el índice seleccionado
    log('Índice actual: ${index.value}');
    log('Progreso actual: ${progress.value}');
  }
}

class BackgroundAnimationController extends GetxController
    with GetTickerProviderStateMixin {
  // Controlador de la animación del fondo
  late final AnimationController animationController;
  late final Animation<Offset> animation;
  // Al iniciar el controlador se inicia la animación
  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();

    animation = Tween<Offset>(
      begin: Offset.zero,
      // end: const Offset(5, 5), // --> Modificar este valor cuando tenga una imagen mas grande que quede mas estética
      end: const Offset(0, 0),
    ).animate(animationController);

    // Listener para reiniciar la animación cuando llegue al final
    animationController.addListener(() {
      if (animationController.isCompleted) {
        animationController.value = 0.0; // Reinicia la animación sin retroceder
      }
    });
    // Mueve la animación del fondo más adelante cuando cambias de página
    animationController.forward(from: ProgressController().progress.value);
  }

  // Al finalizar el controlador se finaliza la animación.
  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}

void showSnackBar(
    String title, String message, BuildContext context, Duration? duration) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    colorText: Theme.of(context).appBarTheme.foregroundColor,
    borderRadius: 8,
    duration: duration ?? const Duration(seconds: 1),
  );
}
