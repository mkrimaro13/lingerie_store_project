import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/controllers/signup.dart';
import 'package:lingerie_store_project/widgets/buttons/extended.dart';

class AcceptanceTerms extends StatelessWidget {
  final controller = Get.put(AcceptanceTermController());

  AcceptanceTerms({super.key});

  @override
  Widget build(BuildContext context) {
    final progressController = Get.find<ProgressController>();
    return Column(
      spacing: 8,
      children: [
        checkboxContainer(
          context: context,
          child: Obx(() => CheckboxListTile(
                title: const Text('Aceptar términos y condiciones'),
                subtitle: const Text('Lee nuestros términos y condiciones'),
                value: controller.acceptTerms.value,
                onChanged: controller.updateTermsAcceptance,
              )),
        ),
        checkboxContainer(
          context: context,
          child: Obx(() => CheckboxListTile(
                title: const Text('Aceptar política de privacidad'),
                subtitle: const Text('Lee nuestra política de privacidad'),
                value: controller.acceptPrivacyPolicy.value,
                onChanged: controller.updatePrivacyPolictAcceptance,
              )),
        ),
        checkboxContainer(
          context: context,
          child: Obx(() => CheckboxListTile(
                title: const Text('Aceptar envío de promociones'),
                subtitle: const Text('Recibe promociones y ofertas especiales'),
                value: controller.acceptPromotions.value,
                onChanged: controller.updatePromotionsAcceptance,
              )),
        ),
        Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExtendedButton(
              buttonLabel: 'Volver',
              onPressed: () {
                progressController.updateProgress(0);
              },
            ),
            ExtendedButton(
              buttonLabel: "Continuar",
              onPressed: () {
                if (controller.acceptTerms.value == false ||
                    controller.acceptPrivacyPolicy.value == false) {
                  showSnackBar(
                      "Información incompleta",
                      "Debes leer y aceptar los términos y la política de privacidad",
                      context,
                      const Duration(seconds: 2));
                } else {
                  showSnackBar("Registro Exitoso",
                      "Datos guardados correctamente", context, null);
                  progressController.updateProgress(3);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}

class AcceptanceTermController extends GetxController {
  Rx<bool> acceptTerms = false.obs;
  Rx<bool> acceptPrivacyPolicy = false.obs;
  Rx<bool> acceptPromotions = false.obs;

  void updateTermsAcceptance(bool? newValue) {
    acceptTerms.value = newValue!;
  }

  void updatePrivacyPolictAcceptance(bool? newValue) {
    acceptPrivacyPolicy.value = newValue!;
  }

  void updatePromotionsAcceptance(bool? newValue) {
    acceptPromotions.value = newValue!;
  }
}

Container checkboxContainer(
    {required Widget child, required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Theme.of(context).colorScheme.primary),
      borderRadius: BorderRadius.circular(8),
      color: Theme.of(context).scaffoldBackgroundColor,
    ),
    // padding: const EdgeInsets.all(8),
    child: child,
  );
}
