import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final Function(String)? validator;
  final bool? readOnly;
  final GestureTapCallback? onTap;

  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.controller,
      this.validator,
      this.readOnly,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap ?? () {},
      controller: controller,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        // labelText: "Primer Nombre, p.e. Manuela",
        labelText: labelText,
        // hintText: "Ingresa tu nombre",
        hintText: hintText,
        prefixIcon: prefixIcon ?? Icon(Icons.person), // Icono al inicio
        suffixIcon: suffixIcon ??
            Icon(Icons.check_circle, color: Colors.green), // Icono al final
        border: OutlineInputBorder(
          // Bordes personalizados
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppBarTheme.of(context).shadowColor!),
        ),
        focusedBorder: OutlineInputBorder(
          // Borde cuando el campo está enfocado
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
        ),
        filled: true, // Activa el fondo de color
        fillColor:
            Theme.of(context).appBarTheme.backgroundColor, // Color de fondo
      ),
      style: TextStyle(
          fontSize: 18,
          color: Theme.of(context)
              .appBarTheme
              .foregroundColor), // Estilo del texto
    );
  }
}
