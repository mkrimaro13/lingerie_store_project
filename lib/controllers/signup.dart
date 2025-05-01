import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/views/signup/personal_data.dart';

import '../models/user_model.dart';

class ProgressController extends GetxController {
  var progress = 0.25.obs; // Observa cambios en el progreso
  var index = 0.obs;

  final PageController pageController = PageController();
  final List<Widget> pages = [PersonalDataView()];

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

class PersonalDataFormController extends GetxController {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthdateController = TextEditingController();
  final genderController = TextEditingController();

  var name = ''.obs;
  var lastName = ''.obs;
  var birthDay = ''.obs;
  var gender = ''.obs;

  Rx<IconData> nameIcon = Icons.person_outline.obs;
  Rx<IconData> lastNameIcon = Icons.person_outline.obs;
  Rx<IconData> birthdateIcon = Icons.calendar_today_outlined.obs;

  @override
  void onInit() {
    super.onInit();

    name.value = nameController.text;
    lastName.value = lastNameController.text;
    birthDay.value = birthdateController.text;
    gender.value = genderController.text;

    nameController.addListener(() {
      name.value = nameController.text;
      validateName(name.value);
      log('Nombre: ${name.value}\nÍcono: ${nameIcon.value} ');
    });
    lastNameController.addListener(() {
      lastName.value = lastNameController.text;
      validateLastName(lastName.value);
      log('Apellido: ${lastName.value}\nÍcono: ${lastNameIcon.value} ');
    });
    birthdateController
        .addListener(() => birthDay.value = birthdateController.text);
    genderController.addListener(() => gender.value = genderController.text);
  }

  @override
  void onClose() {
    nameController.dispose();
    lastNameController.dispose();
    birthdateController.dispose();
    super.dispose();
  }

  UserModel getUserData() {
    DateTime? birthday;
    try {
      if (birthdateController.text.isNotEmpty) {
        final parts = birthdateController.text.split('/');
        birthday = DateTime(
          int.parse(parts[2]), // año
          int.parse(parts[1]), // mes
          int.parse(parts[0]), // día
        );
      }
    } catch (_) {
      birthday = null;
    }

    return UserModel(
      nameController.text.trim(),
      lastNameController.text.trim(),
      birthday,
      gender.value,
    );
  }

  // Validaciones
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      nameIcon.value = Icons.warning_amber_rounded;
      return 'Campo obligatorio';
    }
    if (!RegExp(r"^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]+$").hasMatch(value)) {
      nameIcon.value = Icons.warning_amber_rounded;
      return 'Solo letras y espacios';
    }
    if (value.trim().length < 2) {
      nameIcon.value = Icons.warning_amber_rounded;
      return 'Mínimo 2 caracteres';
    }
    nameIcon.value = Icons.check_circle;
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      lastNameIcon.value = Icons.warning_amber_rounded;
      return 'Campo obligatorio';
    }
    if (!RegExp(r"^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]+$").hasMatch(value)) {
      lastNameIcon.value = Icons.warning_amber_rounded;
      return 'Solo letras y espacios';
    }
    if (value.trim().length < 2) {
      lastNameIcon.value = Icons.warning_amber_rounded;
      return 'Mínimo 2 caracteres';
    }
    lastNameIcon.value = Icons.check_circle;
    return null;
  }

  String? validateBirthdate(String? value) {
    if (value == null || value.trim().isEmpty) {
      birthdateIcon.value = Icons.calendar_month;
      return null;
    }
    try {
      final parts = value.split('/');
      final date = DateTime(
        int.parse(parts[2]),
        int.parse(parts[1]),
        int.parse(parts[0]),
      );
      if (date.isAfter(DateTime.now())) {
        // birthdateIcon.value = Icons.warning_amber_rounded;
        return 'No puede ser una fecha futura';
      }
      if (date.isBefore(DateTime(1900))) {
        // birthdateIcon.value = Icons.warning_amber_rounded;
        return 'Fecha inválida';
      }
    } catch (_) {
      // birthdateIcon.value = Icons.warning_amber_rounded;
      return 'Formato inválido';
    }
    birthdateIcon.value = Icons.calendar_month;
    return null;
  }
}
