import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;  // Cambiar el tipo aquí
  final bool? readOnly;
  final GestureTapCallback? onTap;
  final String? errorMessage;
  final Rx<IconData> icon;  // Añadimos un campo para el ícono

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.validator,
    this.readOnly,
    this.onTap,
    this.errorMessage,
    required this.icon, // Recibimos el ícono dinámico
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        onTap: onTap ?? () {},
        controller: controller,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon ?? Icon(Icons.person),
          suffixIcon: errorMessage == null
              ? Icon(icon.value)  // Cambiamos el ícono dependiendo de la validez
              : Icon(icon.value, color: Colors.amber), // Icono de advertencia
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppBarTheme.of(context).shadowColor!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
          ),
          filled: true,
          fillColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        style: TextStyle(
            fontSize: 18, color: Theme.of(context).appBarTheme.foregroundColor),
        validator: validator, // Cambiar a validator
      );
    });
  }
}
