import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool? readOnly;
  final GestureTapCallback? onTap;
  final void Function(String)? onChanged;
  final String? errorMessage;
  final IconData icon;

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
    this.onChanged,
    this.errorMessage,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap ?? () {},
      onChanged: onChanged ?? (value) {},
      controller: controller,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon ?? Icon(Icons.person),
        suffixIcon: errorMessage == null
            ? Icon(
                icon,
                color: Colors.blueAccent,
              ) // Se cambia el ícono de forma reactiva dependiendo si el valor en el campo es válido
            : Icon(icon, color: Colors.amber), // Icono de advertencia
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
      validator: validator,
    );
  }
}
