import 'package:flutter/material.dart';

// La paleta de colores que mas se va a usar.

class GeneralColors {
  static const Color transparent = Color.fromARGB(0, 255, 255, 255);
}

/// Clase abstracta (interfaz) que define los colores de la aplicación.
/// Se definen los colores primarios, secundarios, de fondo, de acento, de texto y de borde.
abstract class ThemeColors {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color accent;
  final Color text;
  final Color border;

  const ThemeColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.accent,
    required this.text,
    required this.border,
  });
}

/// Paleta de colores para el tema claro.
class LightThemeColors extends ThemeColors {
  static LightThemeColors instance = LightThemeColors._();

  const LightThemeColors._()
      : super(
          primary: const Color(0xFFC5BAFF), // Morado pastel
          secondary: const Color(0xFFC4D9FF), // Azul pastel
          background: const Color(0xFFFBFBFB), // Blanco suave
          accent: const Color(0xffF5EFFF), // Blanco con tono lila
          text: const Color(0xFF17153B), // Azul oscuro para contraste
          border: const Color(0xFFE0D9FF), // Lila pastel para bordes
        );
}

/// Paleta de colores para el tema oscuro.
class DarkThemeColors extends ThemeColors {
  static DarkThemeColors instance = DarkThemeColors._();

  const DarkThemeColors._()
      : super(
          background: const Color(0xFF17153B), // Azul oscuro intenso
          primary: const Color(0xFF8A7ACC), // Morado pastel más oscuro
          secondary: const Color(0xFF718EC6), // Azul pastel más profundo
          accent: const Color(0xFF5D5475), // Lila grisáceo para contraste
          text: const Color(0xFFF5EFFF), // Blanco lila para textos
          border: const Color(0xFF4A3D6A), // Morado grisáceo para bordes
        );
}
