import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingerie_store_project/ui/pages/loading.dart';
import 'package:lingerie_store_project/ui/widgets/cart_page/cart_provider.dart';
import 'package:lingerie_store_project/utils/colors.dart';
import 'package:lingerie_store_project/utils/theme_controller.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Barra de estado transparente
    statusBarIconBrightness: Brightness.light, // Íconos claros
    systemNavigationBarColor: Colors.black, // Fondo de la barra de navegación
    systemNavigationBarIconBrightness:
        Brightness.light, // Íconos claros en la barra
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ThemeController.instance),
      ],
      child: const LingerieStore(),
    ),
  );
}

class LingerieStore extends StatefulWidget {
  const LingerieStore({super.key});

  @override
  State<LingerieStore> createState() => _LingerieStoreState();
}

class _LingerieStoreState extends State<LingerieStore> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController =
        Provider.of<ThemeController>(context);
    return
        // ValueListenableBuilder(
        //   valueListenable: _themeController.isDark,
        //   builder: (context, isDark, child) {
        //     return
        MaterialApp(
      themeMode: themeController.themeMode,
      // themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: appTheme(Brightness.light, LightThemeColors.instance),
      darkTheme: appTheme(Brightness.dark, DarkThemeColors.instance),
      title: 'Velora',
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      home: SafeArea(child: const LoadingScreen()),
    );
    // },
    // );
  }

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
          secondary: colors.secondary),
      scaffoldBackgroundColor: colors.background,
      appBarTheme: AppBarTheme(
        toolbarHeight: 50,
        elevation: 4,
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
        elevation: 4,
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
}
