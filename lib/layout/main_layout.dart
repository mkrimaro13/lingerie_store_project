import 'package:lingerie_store_project/ui/pages/cart.dart';
import 'package:lingerie_store_project/ui/pages/profile.dart';
import 'package:lingerie_store_project/utils/animations/fade_in.dart';
import 'package:flutter/material.dart';
import 'package:lingerie_store_project/ui/pages/home.dart';
import 'package:lingerie_store_project/ui/pages/products.dart';
import 'package:lingerie_store_project/ui/widgets/main_layout/bottom_navigation_bar.dart';
import 'package:lingerie_store_project/ui/widgets/main_layout/sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Builder(builder: (context) {
            return IconButton(
                tooltip: 'Menu',
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu_rounded));
          }),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded),
              tooltip: 'Buscar',
              onPressed: () {
                // Función de búsqueda.
              },
            ),
          ],
        ),
        /*drawer: Drawer(
          width: 215,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(20),
            ),
          ),
          child: CustomSideBar(),
        ),*/
        body: PageView.builder(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _pages.length,
          itemBuilder: (context, index) {
            return FadeInAnimation(child: _pages[index]);
          },
          onPageChanged: (index) => _onItemTapped(index),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }

  int selectedIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    HomePage(),
    ProductsPage(),
    ProductsCartPage(),
    ProfilePage()
  ];

  _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.jumpToPage(
      index,
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // Prevent memory leaks
    super.dispose();
  }
}
