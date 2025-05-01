import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/controllers/signup.dart';
import 'package:lingerie_store_project/widgets/buttons/extended.dart';
import 'package:lingerie_store_project/widgets/signup/form_text_field.dart';

class PersonalDataForm extends StatefulWidget {
  const PersonalDataForm({super.key});

  @override
  State<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  /// Esta parte tiene como finalidad obtener el ancho del botón de texto
  /// para usar el mismo ancho en el menu desplegable y que sea estético.
  /// Ya que asignándole un ancho "infinito" al menú desplegable lo rompía,
  /// Y encapsulado en un [Container] o una [SizedBox] lo hacía mas pequeño.
  final GlobalKey textFieldKey = GlobalKey();
  double? textFieldWidth;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox box =
          textFieldKey.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        textFieldWidth = box.size.width;
        // print("Ancho del CustomTextField: $textFieldWidth");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(PersonalDataFormController());

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return CustomTextField(
                key: textFieldKey,
                controller: controller.nameController,
                validator: controller
                    .validateName, // Llamamos al controlador para la validación
                labelText: "Nombres",
                hintText: "Ingresa tu nombre",
                icon: controller.nameIcon.value, // Pasamos el ícono dinámico
                errorMessage:
                    controller.validateName(controller.nameController.text),
              );
            }),
            Obx(() {
              return CustomTextField(
                controller: controller.lastNameController,
                validator: controller
                    .validateLastName, // Llamamos al controlador para la validación
                labelText: "Apellidos",
                hintText: "Ingresa tu apellido",
                icon:
                    controller.lastNameIcon.value, // Pasamos el ícono dinámico
                errorMessage: controller
                    .validateLastName(controller.lastNameController.text),
              );
            }),
            CustomTextField(
              controller: controller.birthdateController,
              validator: controller
                  .validateBirthdate, // Llamamos al controlador para la validación
              labelText: "Cumpleaños (Opcional)",
              hintText: "Cumpleaños",
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                controller.birthdateController.text = pickedDate != null
                    ? "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"
                    : "";
                log(controller.birthdateController.text);
              },
              icon: controller.birthdateIcon.value, // Pasamos el ícono dinámico
              errorMessage: controller
                  .validateBirthdate(controller.birthdateController.text),
            ),
            // Mostramos el Dropdown solo si el ancho ya fue calculado
            if (textFieldWidth != null)
              DropdownMenu<Gender>(
                width: textFieldWidth!,
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: const TextStyle(fontSize: 18),
                  filled: true,
                  fillColor: Theme.of(context).appBarTheme.backgroundColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppBarTheme.of(context).shadowColor ?? Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                ),
                initialSelection: Gender.female,
                controller: controller.genderController,
                requestFocusOnTap: true,
                label: const Text('Género'),
                onSelected: (Gender? gender) {
                  if (gender == null) {
                    controller.gender.value = Gender.female.toString();
                  } else {
                    controller.gender.value = gender.gender;
                  }
                },
                dropdownMenuEntries: Gender.entries,
              ),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExtendedButton(
                  buttonLabel: 'Cancelar',
                  onPressed: () {
                    Get.until(
                        (route) => Get.currentRoute == "/RepaintBoundary");
                    Get.delete();
                  },
                ),
                ExtendedButton(
                  buttonLabel: "Continuar",
                  onPressed: () {
                    if (controller.name.value.isEmpty ||
                        controller.lastName.value.isEmpty) {
                      Get.snackbar("Información incompleta",
                          "Por favor completa la información requerida");
                    } else if (formKey.currentState!.validate()) {
                      final user = controller.getUserData();
                      log("Nombre: ${user.name}");
                      log("Apellido: ${user.lastName}");
                      log("Nacimiento: ${user.birthDay}");
                      log("Género: ${user.genre}");

                      Get.snackbar(
                          "Registro Exitoso", "Datos guardados correctamente");
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

typedef GenderEntry = DropdownMenuEntry<Gender>;

enum Gender {
  male('Masculino', Icons.male_rounded),
  female('Femenino', Icons.female_rounded);

  const Gender(this.gender, this.icon);
  final String gender;
  final IconData icon;

  static final List<GenderEntry> entries = UnmodifiableListView<GenderEntry>(
    values.map<GenderEntry>(
      (Gender gender) => GenderEntry(
          value: gender, label: gender.gender, leadingIcon: Icon(gender.icon)),
    ),
  );
}
