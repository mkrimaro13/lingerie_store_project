import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingerie_store_project/utils/colors.dart';
import 'package:lingerie_store_project/layout/main_layout.dart';

void main() {
  runApp(const LingerieStore());
}

/// Punto principal de la aplicación.
/// No requiere almacenar estados ya que simplemente
/// brinda el estilo general de la aplicación e
/// inicia el [Widget] principal.
class LingerieStore extends StatelessWidget {
  const LingerieStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Velora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: BrandColors.white.value, brightness: Brightness.light),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSerifOttomanSiyaqTextTheme(),
      ),
      // darkTheme: ThemeData(
      //     colorScheme: ColorScheme.fromSeed(
      //   seedColor: Colors.black87,
      //   brightness: Brightness.dark,
      // ).copyWith(surface: Colors.grey[850]!)),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
