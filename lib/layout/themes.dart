import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingerie_store_project/layout/themecolors.dart';

/// Método que incluye la paleta de colores para los diferentes componentes y las fuentes de Google Fonts.
ThemeData appTheme(Brightness brightness, ThemeColors colors) {
  return ThemeData(
    textTheme: GoogleFonts.notoSerifOttomanSiyaqTextTheme().apply(
      bodyColor: colors.text,
      displayColor: colors.text,
    ),
    colorScheme: ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: colors.primary,
      primary: colors.primary,
      secondary: colors.secondary,
    ),
    scaffoldBackgroundColor: colors.background,
    appBarTheme: AppBarTheme(
      toolbarHeight: 50,
      elevation: 5,
      backgroundColor: colors.background,
      foregroundColor: colors.text,
      shadowColor: colors.border,
      titleTextStyle: GoogleFonts.notoSerifOttomanSiyaq(
        color: colors.text,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      color: colors.background,
      shadowColor: colors.border,
      elevation: 8,
      margin: const EdgeInsets.all(8),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colors.background,
      shadowColor: colors.border,
      indicatorColor: colors.secondary,
      elevation: 8,
      height: 75,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      indicatorShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(20, 40),
        maximumSize: Size(double.infinity, 40),
        backgroundColor: colors.secondary,
        foregroundColor: colors.text,
        shadowColor: colors.border,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: colors.text,
      size: 24,
    ),
  );
}
