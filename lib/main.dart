import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/layout/themecolors.dart';
import 'package:lingerie_store_project/layout/themes.dart';
import 'package:lingerie_store_project/pages/loading.dart';

void main() {
  // debugPrintRebuildDirtyWidgets = true;

  /// Se asegura que la aplicación halla iniciado
  WidgetsFlutterBinding.ensureInitialized();

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
    );
  }
}
