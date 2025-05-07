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
    final controller = Get.put(PersonalDataFormController());
    final formKey = controller.formKey;

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
                key: controller.nameFieldKey,
                controller: controller.nameController,
                validator: controller
                    .validateName, // Llamamos al controlador para la validación
                labelText: "Nombres",
                hintText: "Ingresa tu nombre",
                prefixIcon: controller.prefixNameIcon,
                suffixIcon: controller.suffixNameIcon.value,
                errorMessage:
                    controller.validateName(controller.nameController.text),
                onChanged: (value) => controller.name.value = value,
              );
            }),
            Obx(() {
              return CustomTextField(
                key: controller.lastNameFieldKey,
                controller: controller.lastNameController,
                validator: controller
                    .validateLastName, // Llamamos al controlador para la validación
                labelText: "Apellidos",
                hintText: "Ingresa tu apellido",
                prefixIcon: controller.prefixLastNameIcon,
                suffixIcon: controller.suffixLastNameIcon.value,
                errorMessage: controller
                    .validateLastName(controller.lastNameController.text),
                onChanged: (value) => controller.name.value = value,
              );
            }),
            CustomTextField(
              key: textFieldKey,
              controller: controller.birthdateController,
              validator: controller
                  .validateBirthdate, // Llamamos al controlador para la validación
              labelText: "Cumpleaños (Opcional)",
              hintText: "Cumpleaños",
              readOnly: true,
              prefixIcon: controller.prefixBirthdateIcon,
              suffixIcon: controller.suffixBirthdateIcon,
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
              errorMessage: controller
                  .validateBirthdate(controller.birthdateController.text),
            ),
            // Mostramos el Dropdown solo si el ancho ya fue calculado
            if (textFieldWidth != null)
              DropdownMenu<Gender>(
                width: textFieldWidth!,
                leadingIcon: controller.prefixGenderIcon,
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
                      showSnackBar(
                          "Información incompleta",
                          "Por favor completa la información requerida",
                          context,
                          const Duration(seconds: 2));
                    } else if (formKey.currentState!.validate()) {
                      DateTime? parsedBirthDate;
                      if (controller.birthDay.value.isNotEmpty) {
                        try {
                          final parts = controller.birthDay.value.split('/');
                          final day = int.parse(parts[0]);
                          final month = int.parse(parts[1]);
                          final year = int.parse(parts[2]);
                          parsedBirthDate = DateTime(year, month, day);
                        } catch (e) {
                          log('Error al parsear la fecha: $e');
                          parsedBirthDate =
                              null; // O podrías mostrar un error al usuario
                        }
                      }

                      Get.find<UserDataSignupController>().updatePersonalData(
                        controller.name.value,
                        controller.lastName.value,
                        parsedBirthDate, // Usamos la fecha parseada
                        controller.gender.value,
                      );

                      showSnackBar("Registro Exitoso",
                          "Datos guardados correctamente", context, null);
                      final progressController = Get.find<ProgressController>();
                      progressController.updateProgress(1);
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

class PersonalDataFormController extends GetxController {
  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // gestiona todo el formulario

  Icon prefixNameIcon = Icon(Icons.person_rounded, color: Colors.lightBlue);
  Icon prefixLastNameIcon = Icon(Icons.person_rounded, color: Colors.lightBlue);
  Icon prefixBirthdateIcon =
      Icon(Icons.calendar_today_rounded, color: Colors.lightBlue);
  Icon prefixGenderIcon = Icon(Icons.wc_rounded, color: Colors.lightBlue);

  Rx<Icon> suffixNameIcon =
      Icon(Icons.person_rounded, color: Colors.lightBlue).obs;
  Rx<Icon> suffixLastNameIcon =
      Icon(Icons.person_rounded, color: Colors.lightBlue).obs;
  Icon suffixBirthdateIcon =
      Icon(Icons.calendar_today_rounded, color: Colors.lightBlue);

  Icon warningIcon = Icon(Icons.priority_high_rounded, color: Colors.redAccent);
  Icon checkIcon = Icon(Icons.check_circle, color: Colors.green);

  Rx<String> name = ''.obs;
  Rx<String> lastName = ''.obs;
  Rx<String> birthDay = ''.obs;
  Rx<String> gender = ''.obs;

  TextEditingController nameController = TextEditingController(text: "Manuela");
  TextEditingController lastNameController =
      TextEditingController(text: "Lopera");
  TextEditingController birthdateController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  GlobalKey<FormFieldState> nameFieldKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> lastNameFieldKey = GlobalKey<FormFieldState>();

  Rx<Icon> nameIcon = Icon(Icons.person_outline, color: Colors.lightBlue).obs;
  Rx<Icon> lastNameIcon =
      Icon(Icons.person_outline, color: Colors.lightBlue).obs;
  Rx<Icon> birthdateIcon =
      Icon(Icons.calendar_today_outlined, color: Colors.lightBlue).obs;

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
      nameFieldKey.currentState?.validate();
    });
    lastNameController.addListener(() {
      lastName.value = lastNameController.text;
      validateLastName(lastName.value);
      log('Apellido: ${lastName.value}\nÍcono: ${lastNameIcon.value} ');
      lastNameFieldKey.currentState?.validate(); // Solo valida este campo
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

  // Validaciones
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      suffixNameIcon.value = warningIcon;
      return 'Campo obligatorio';
    }
    if (!RegExp(r"^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]+$").hasMatch(value)) {
      suffixNameIcon.value = warningIcon;

      return 'Solo letras y espacios';
    }
    if (value.trim().length < 2) {
      suffixNameIcon.value = warningIcon;

      return 'Mínimo 2 caracteres';
    }
    suffixNameIcon.value = checkIcon;
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      suffixLastNameIcon.value = warningIcon;
      return 'Campo obligatorio';
    }
    if (!RegExp(r"^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]+$").hasMatch(value)) {
      suffixLastNameIcon.value = warningIcon;

      return 'Solo letras y espacios';
    }
    if (value.trim().length < 2) {
      suffixLastNameIcon.value = warningIcon;

      return 'Mínimo 2 caracteres';
    }
    suffixLastNameIcon.value = checkIcon;
    return null;
  }

  String? validateBirthdate(String? value) {
    if (value == null || value.trim().isEmpty) {
      birthdateIcon.value = Icon(
        Icons.calendar_month,
        color: Colors.lightBlue,
      );
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
        birthdateIcon.value = Icon(
          Icons.priority_high_rounded,
          color: Colors.redAccent,
        );
        return 'No puede ser una fecha futura';
      }
      if (date.isBefore(DateTime(1900))) {
        birthdateIcon.value = Icon(
          Icons.priority_high_rounded,
          color: Colors.redAccent,
        );
        return 'Fecha inválida';
      }
      // if(date.is)
    } catch (_) {
      // birthdateIcon.value = Icons.warning_amber_rounded;
      return 'Formato inválido';
    }
    birthdateIcon.value = Icon(
      Icons.calendar_month,
      color: Colors.lightBlue,
    );
    return null;
  }
}
