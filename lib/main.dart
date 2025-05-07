import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/controllers/main_layout.dart';
import 'package:lingerie_store_project/layout/main_layout.dart';
import 'package:lingerie_store_project/layout/themecolors.dart';
import 'package:lingerie_store_project/layout/themes.dart';
import 'package:lingerie_store_project/pages/loading.dart';
import 'package:lingerie_store_project/pages/signup.dart';

void main() {
  /// Para Android:
  /// Establece el color de la barra superior y la barra virtual de los botones.
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Barra de estado transparente
      statusBarIconBrightness:
          Brightness.light, // Íconos claros en la barra de estado.
      systemNavigationBarColor: Colors.black, // Fondo de la barra de navegación
      systemNavigationBarIconBrightness:
          Brightness.light, // Íconos claros en la barra
    ),
  );
  runApp(const LingerieStore());
}

class LingerieStore extends StatelessWidget {
  const LingerieStore({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      title: 'Velora',
      themeMode: ThemeMode.system,
      theme: appTheme(Brightness.light, LightThemeColors.instance),
      darkTheme: appTheme(Brightness.dark, DarkThemeColors.instance),
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
      getPages: [
        GetPage(name: "/", page: () => LoadingPage()),
        GetPage(
          name: "/home",
          page: () {
            final initialIndexStr = Get.parameters['initialIndex'];
            final initialIndex = initialIndexStr != null
                ? int.tryParse(initialIndexStr) ?? 0
                : 0;
            // Elimina el controlador anterior si existe
            if (Get.isRegistered<MainLayoutController>()) {
              Get.delete<MainLayoutController>();
            }
            // Crea uno nuevo con el índice deseado
            Get.put(MainLayoutController(initialIndex: initialIndex));
            return MainLayout(initialIndex: initialIndex);
          },
        ),
        GetPage(name: "/signup", page: () => SignupPage()),
      ],
    );
  }
}
