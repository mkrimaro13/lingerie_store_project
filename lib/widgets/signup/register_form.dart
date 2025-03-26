import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:lingerie_store_project/controllers/signup.dart';
import 'package:lingerie_store_project/widgets/buttons/extended.dart';
import 'package:lingerie_store_project/widgets/signup/form_text_field.dart';

class PersonalDataForm extends StatelessWidget {
  const PersonalDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final PersonalDataFormController controller =
        Get.put(PersonalDataFormController());
    return Form(
        key: formKey,
        child: KeyboardAvoider(
            child: SingleChildScrollView(
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                controller: controller.firstNameController,
                validator: (value) =>
                    value.isEmpty ? "Campo obligatorio" : null,
                labelText: "Nombres",
                hintText: "Ingresa tu nombre",
              ),
              CustomTextField(
                controller: controller.lastNameController,
                validator: (value) =>
                    value.isEmpty ? "Campo obligatorio" : null,
                labelText: "Apellidos",
                hintText: "Apellidos",
              ),
              CustomTextField(
                prefixIcon: Icon(Icons.calendar_month_rounded),
                controller: controller.birthdateController,
                labelText: "Cumpleaños (Opcional)",
                hintText: "Cumpleaños",
                readOnly: true,
                onTap: () async {
                  /// https://api.flutter.dev/flutter/material/showDatePicker.html
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  controller.birthdateController.text = pickedDate != null
                      ? "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"
                      : "No haz seleccionado ninguna fecha";
                  log(controller.birthdateController.text.toString());
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Género (Opcional)",
                  border: OutlineInputBorder(
                    // Bordes personalizados
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: AppBarTheme.of(context).shadowColor!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Borde cuando el campo está enfocado
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  filled: true, // Activa el fondo de color
                  fillColor: Theme.of(context)
                      .appBarTheme
                      .backgroundColor, // Color de fondo
                ),
                dropdownColor: Theme.of(context).appBarTheme.backgroundColor,
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context)
                        .appBarTheme
                        .foregroundColor), // Estilo del texto),
                items: ["Masculino", "Femenino"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 16,
                            color:
                                Theme.of(context).appBarTheme.foregroundColor),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.gender.value = value ?? "";
                },
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
                      Get.delete(); /// -> Elimina el controlador al salir de la la vista.
                    },
                  ),
                  ExtendedButton(
                    buttonLabel: "Continuar",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.snackbar("Registro Exitoso",
                            "Datos guardados correctamente");
                      }
                    },
                  )
                ],
              )
            ],
          ),
        )));
  }
}
