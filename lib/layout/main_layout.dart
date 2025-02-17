import 'package:lingerie_store_project/layout/colors.dart';
import 'package:flutter/material.dart';
import 'package:lingerie_store_project/ui/pages/home.dart';
import 'package:lingerie_store_project/ui/pages/products.dart';
import 'package:lingerie_store_project/ui/widgets/bottom_navigation_bar.dart';

/// Se crea la vista dinámica para poder utilizar el [BottomNavigationBar] de forma estática.
/// Esto para que tenga botones, y entre los botones permita cambiar entre vistas.
/// Inspiración: Apps de Temu y AliExpress por ejemplo.
/// Donde la barra inferior es fija y cambian las pantallas/páginas.
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  /// Se crea una clase que es dueña de un [State].
  /// Acorde a la documentación: https://docs.flutter.dev/ui/interactivity
  @override
  State<HomeScreen> createState() => _MainScreenState();
}

/// Se crea la clase que contendrá ese estado [State] y el método [build] que cargará los [Widget]s.
class _MainScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: BrandColors.transparent.value,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded),
              tooltip: 'Buscar...',
              onPressed: () {
                // Función de búsqueda.
              },
            ),
          ],
        ),

        /// https://api.flutter.dev/flutter/widgets/Stack-class.html
        /// https://api.flutter.dev/flutter/widgets/IndexedStack-class.html
        /// Es un tipo de [Widget] muestra sus [children] de a uno, de acuerdo a un índice.
        body: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        // body: IndexedStack(
        //   index: _selectedIndex,
        //   children: _pages,
        // ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }

  /// [index] inicializado en 0.
  int _selectedIndex = 0;

  final PageController _pageController =
      PageController(); // ✅ Controls animation

  /// Lista de páginas ([Widget]s) entre las que se realizará la funcionalidad.
  final List<Widget> _pages = [
    HomePage(),
    ProductsPage(),
  ];

  /// Función que cambia el [index] de acuerdo a la página seleccionada.
  /// Esta función debe ir aquí para poder actualizar el [index]
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    /// Se brinda una animación de "desvanecimiento" al cargar una página
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300), // Adjust speed
      curve: Curves.easeInOut, // Animation curve
    );
  }

  /// [dispose] elimina el objeto de la memoria, pertenece a [PageController]
  /// Aunque tenga la etiqueta [override] implementa el ancestro, que directamente
  /// descarta el objeto y todas las implementen que hereden del ancestro en su llamado.
  @override
  void dispose() {
    _pageController.dispose(); // Prevent memory leaks
    super.dispose();
  }
}
