import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  /// Patrón Singleton
  /// Busca tener una única instancia de un objeto
  /// En este caso del controlador.
  static final ThemeController instance = ThemeController._();
  ThemeController._();

  /// Inicialmente toma el brillo del sistema, si es claro o oscuro.
  ThemeMode themeMode = ThemeMode.system;

  // void toggleTheme() {
  //   if (themeMode == ThemeMode.system) {
  //     themeMode = ThemeMode.light;
  //   } else if (themeMode == ThemeMode.light) {
  //     themeMode = ThemeMode.dark;
  //   } else if (themeMode == ThemeMode.dark) {
  //     themeMode = ThemeMode.light;
  //   } else {
  //     themeMode = ThemeMode.system;
  //   }
  //   notifyListeners(); // Notifica a la UI sobre el cambio
  // }
}

// import 'package:flutter/material.dart';

// class ThemeController {
//   /// Patrón Singleton.
//   /// Se refiere a que siempre se crea y se refiere al mismo objeto.
//   static final ThemeController instance = ThemeController._();
//   ThemeController._();

//   ValueNotifier<bool> isDark = ValueNotifier<bool>(false);

//   void changeTheme() {
//     isDark.value = !isDark.value;
//   }
// }
