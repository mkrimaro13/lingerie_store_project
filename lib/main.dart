import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingerie_store_project/layout/colors.dart';
import 'package:lingerie_store_project/layout/main_layout.dart';
import 'package:lingerie_store_project/ui/pages/initial_screen.dart';
import 'package:lingerie_store_project/ui/pages/products_screen.dart';

void main() {
  runApp(const LingerieStore());
}

class LingerieStore extends StatelessWidget {
  const LingerieStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Velora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(BrandColors.brandPastelPurple1.value)),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSerifOttomanSiyaqTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/Home', // Start from HomeScreen
      routes: {
        '/Home': (context) => MainLayout(child: InitialScreen()),
        '/Products': (context) => MainLayout(child: ProductsScreen()),
      },
    );
  }
}
