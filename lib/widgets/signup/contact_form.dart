import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/controllers/signup.dart';
import 'package:lingerie_store_project/widgets/buttons/extended.dart';
import 'package:lingerie_store_project/widgets/signup/form_text_field.dart';

class ContactInformationForm extends StatefulWidget {
  const ContactInformationForm({super.key});

  @override
  State<ContactInformationForm> createState() => _ContactInformationFormState();
}

class _ContactInformationFormState extends State<ContactInformationForm> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactFormControler());
    final formKey = controller.formKey;
    final progressController = Get.find<ProgressController>();
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode
          .onUserInteraction, // Permite habilitar la validacion y actualización de los campos de texto en tiempo real
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          spacing: 24,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return CustomTextField(
                controller: controller.emailController,
                validator: (value) => controller.validateEmail(value!),
                labelText: "Email",
                hintText: "Ingresa tu email",
                errorMessage: controller.validateEmail(controller.email.value),
                prefixIcon: controller.prefixEmailIcon,
                suffixIcon: controller.suffixEmailIcon,
                onChanged: (value) => controller.email.value = value,
              );
            }),
            Obx(() {
              return CustomTextField(
                controller: controller.phoneController,
                validator: (value) => controller.validatePhone(value!),
                labelText: "Teléfono",
                hintText: "Ingresa tu teléfono",
                errorMessage: controller.validatePhone(controller.phone.value),
                prefixIcon: controller.prefixPhoneIcon,
                suffixIcon: controller.suffixPhoneIcon,
                onChanged: (value) => controller.phone.value = value,
              );
            }),
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
                    if (controller.email.value.isEmpty ||
                        controller.phone.value.isEmpty) {
                      showSnackBar(
                          "Información incompleta",
                          "Por favor completa la información requerida",
                          context,
                          const Duration(seconds: 2));
                    } else if (formKey.currentState!.validate()) {
                      Get.find<UserDataSignupController>().updateContactData(
                        controller.email.value,
                        controller.phone.value,
                      );
                      showSnackBar("Registro Exitoso",
                          "Datos guardados correctamente", context, null);
                      progressController.updateProgress(2);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContactFormControler extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Icon prefixEmailIcon = Icon(Icons.email_rounded, color: Colors.lightBlue);
  Icon prefixPhoneIcon = Icon(Icons.phone_rounded, color: Colors.lightBlue);

  Icon suffixEmailIcon = Icon(Icons.email_rounded, color: Colors.lightBlue);
  Icon suffixPhoneIcon = Icon(Icons.phone_rounded, color: Colors.lightBlue);

  Icon warningIcon = Icon(Icons.priority_high_rounded, color: Colors.redAccent);
  Icon checkIcon = Icon(Icons.check_circle, color: Colors.green);

  Rx<String> email = ''.obs;
  Rx<String> phone = ''.obs;

  TextEditingController emailController =
      TextEditingController(text: "prueba@correo.com");
  TextEditingController phoneController =
      TextEditingController(text: "3001234567");

  @override
  void onInit() {
    super.onInit();
    email.value = emailController.text;
    phone.value = phoneController.text;

    emailController.addListener(() {
      email.value = emailController.text;
      validateEmail(email.value);
    });

    phoneController.addListener(() {
      phone.value = phoneController.text;
      validatePhone(phone.value);
    });
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      suffixEmailIcon = warningIcon;
      return 'El email no puede estar vacío';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      suffixEmailIcon = warningIcon;
      return 'Email inválido';
    } else {
      suffixEmailIcon = checkIcon;
      return null;
    }
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      suffixPhoneIcon = warningIcon;
      return 'El teléfono no puede estar vacío';
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      suffixPhoneIcon = warningIcon;
      return 'Teléfono inválido';
    } else {
      suffixPhoneIcon = checkIcon;
      return null;
    }
  }
}
