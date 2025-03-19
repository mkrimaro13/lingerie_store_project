import 'package:flutter/material.dart';

/// La barra inferior es dinámica.
/// Primero debe ser persistente, aunque suene contradictorio, en toda la aplicación.
/// La [NavigationBar] debe mantenerse visible y en su posición inferior.
/// Segundo cuenta con botones animados que almacenan la lista de opciones (pantallas) principales.
/// Cuenta con índice que almacena cada una de las páginas principales entre las cuales rotará.
/// Y una función que debe ser compartida con la [HomeScreen] para actualizarse de forma conjunta.
class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const CustomBottomNavigationBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBar();
}

class _CustomBottomNavigationBar extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
          selectedIndex: widget.selectedIndex,
          onDestinationSelected: widget.onItemTapped,
          
          destinations: [
            _buildNavItem(Icons.home_rounded, Icons.home_outlined, 'Inicio'),
            _buildNavItem(Icons.shopping_bag_rounded,
                Icons.shopping_bag_outlined, 'Productos'),
            _buildNavItem(Icons.shopping_cart_rounded,
                Icons.shopping_cart_outlined, 'Carrito'),
            _buildNavItem(
                Icons.person_2_rounded, Icons.person_2_outlined, 'Perfil'),
          ],
        );
  }

  NavigationDestination _buildNavItem(
      IconData iconSelected, IconData iconUnselected, String label) {
    return NavigationDestination(
      selectedIcon: Icon(iconSelected),
      icon: Icon(iconUnselected),
      label: label,
      tooltip: label,
    );
  }
}
