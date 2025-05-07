import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lingerie_store_project/controllers/signup.dart';
import 'package:lingerie_store_project/models/user_model.dart';
import 'package:lingerie_store_project/widgets/buttons/extended.dart';
import 'package:lingerie_store_project/widgets/signup/contact_form.dart';
import 'package:lingerie_store_project/widgets/signup/register_form.dart';
import 'package:lingerie_store_project/widgets/signup/terms.dart';

class Preferences extends StatelessWidget {
  final PreferencesController controller = Get.put(PreferencesController());

  Preferences({super.key});

  @override
  Widget build(BuildContext context) {
    final progressController = Get.find<ProgressController>();

    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Obx(() => GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: Category.values.map((category) {
                  final isSelected =
                      controller.selectedInterests.contains(category);
                  return GestureDetector(
                    onTap: () {
                      controller.toggleInterest(category, !isSelected);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: isSelected ? 0.9 : 0.4),
                        border: Border.all(
                            color: isSelected
                                ? Colors.grey
                                : Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          category.name.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .appBarTheme
                                  .foregroundColor),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
        ),
        Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExtendedButton(
              buttonLabel: 'Volver',
              onPressed: () {
                progressController.updateProgress(2);
              },
            ),
            ExtendedButton(
                buttonLabel: "Finalizar",
                onPressed: () {
                  if (controller.selectedInterests.isEmpty) {
                    showSnackBar(
                        "Información incompleta",
                        "Por favor selecciona al menos una categoría de interés",
                        context,
                        const Duration(seconds: 2));
                    return;
                  } else {
                    Get.find<UserDataSignupController>().updateInterests(
                      controller.getSelectedCategories(),
                    );
                    Get.find<UserDataSignupController>().submitForm();
                    showSnackBar("Registro Exitoso",
                        "Datos guardados correctamente", context, null);
                    Get.offAllNamed("/home", parameters: {'initialIndex': '2'});
                    Get.delete<PreferencesController>();
                    Get.delete<PersonalDataFormController>();
                    Get.delete<ContactFormControler>();
                    Get.delete<AcceptanceTermController>();
                    Get.delete<ProgressController>();
                  }
                }),
          ],
        ),
      ],
    );
  }
}

class PreferencesController extends GetxController {
  RxList<Category> selectedInterests = <Category>[].obs;

  void toggleInterest(Category category, bool isChecked) {
    if (category == Category.none) {
      if (isChecked) {
        selectedInterests.clear();
        selectedInterests.add(Category.none);
        log('Seleccionado: ${Category.none.name}');
      } else {
        selectedInterests.remove(Category.none);
        log('Deseleccionado: ${Category.none.name}');
      }
    } else {
      // Si se selecciona otra categoría y 'none' está seleccionado, deselecciona 'none' primero
      if (isChecked && selectedInterests.contains(Category.none)) {
        selectedInterests.remove(Category.none);
        log('Deseleccionado automáticamente: ${Category.none.name} (al seleccionar otra categoría)');
      }

      if (isChecked) {
        if (!selectedInterests.contains(category)) {
          selectedInterests.add(category);
          log('Seleccionado: ${category.name}');
        }
      } else {
        selectedInterests.remove(category);
        log('Deseleccionado: ${category.name}');
      }

      // Si se desmarca cualquier otra opción, asegúrate de que 'none' también se desmarque (si estaba seleccionado solo)
      if (selectedInterests.isNotEmpty &&
          selectedInterests.every((item) => item != Category.none) &&
          !isChecked &&
          category != Category.none) {
        selectedInterests.remove(Category.none);
        log('Deseleccionado: ${Category.none.name} (al deseleccionar la última otra categoría)');
      }
    }
  }

  // Método para obtener los intereses seleccionados (para guardar en el modelo)
  List<Category> getSelectedCategories() {
    return selectedInterests.toList();
  }
}
