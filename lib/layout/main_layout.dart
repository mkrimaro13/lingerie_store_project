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
  const HomeScreen({super.key});

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
          /// Sidebar, no necesaria por ahora, ya que se está usando un
          /// [BottomNavigationBar]
          // leading: Builder(builder: (context) {
          //   return IconButton(
          //       onPressed: () {
          //         Scaffold.of(context).openDrawer();
          //       },
          //       icon: Icon(Icons.menu_rounded));
          // }),
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
            IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode_rounded)),
          ],
        ),
        // drawer: Drawer(
        //   width: 215,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.horizontal(
        //       right: Radius.circular(20),
        //     ),
        //   ),
        //   child: CustomSideBar(),
        // ),

        /// https://api.flutter.dev/flutter/widgets/Stack-class.html
        /// https://api.flutter.dev/flutter/widgets/IndexedStack-class.html
        /// Es un tipo de [Widget] muestra sus [children] de a uno, de acuerdo a un índice.
        /// Mantiene todas las páginas superpuestas y cargadas en memoria todo el tiempo.
        /// No permite animaciones (de forma nativa)
        // body: IndexedStack(
        //   index: _selectedIndex,
        //   children: _pages,
        // ),

        /// https://api.flutter.dev/flutter/widgets/PageView-class.html
        /// A diferencia de la pila indexada esta clase no mantiene
        /// las páginas cargadas en memoria todo el tiempo.
        /// Solo carga a memoria cada página según se carga su índice.
        /// Permite animaciones.
        /// Como contraparte, se debe establecer que el controlador
        /// de la página se "destruya" cada vez se pase a otra, para evitar
        /// la sobre carga.
        body: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: (index) => _onItemTapped(index),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }

  /// [index] inicializado en 0.
  int _selectedIndex = 0;

  /// Permite controlar las animaciones
  final PageController _pageController = PageController();

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

    /// Se brinda una animación de [ease]"desvanecimiento" al cargar una página
    /// Sin esta instrucción no se realiza el cambio entre las páginas
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
