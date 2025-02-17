import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingerie_store_project/layout/colors.dart';
import 'package:lingerie_store_project/layout/main_layout.dart';

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
            seedColor: BrandColors.brandPastelPurple1.value),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSerifOttomanSiyaqTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
