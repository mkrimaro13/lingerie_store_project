import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/views/signup/personal_data.dart';

class ProgressController extends GetxController {
  var progress = 0.25.obs; // Observa cambios en el progreso
  var index = 0.obs;

  final PageController pageController = PageController();

  final List<Widget> pages = [PersonalDataView()];

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
    index.value = selectedIndex; // Actualiza el índice seleccionado
    log('Índice actual: ${index.value}');
    log('Progreso actual: ${progress.value}');
  }
}

class PersonalDataFormController extends GetxController {
  var firstNameController = TextEditingController();
  var middleNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var birthdateController = TextEditingController();
  var gender = "".obs;
}
