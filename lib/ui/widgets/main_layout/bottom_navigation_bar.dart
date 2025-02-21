import 'package:flutter/material.dart';
import 'package:lingerie_store_project/utils/colors.dart';

/// La barra inferior es dinámica.
/// Primero debe ser persistente, aunque suene contradictorio, en toda la aplicación.
/// La [BottomNavigationBar] debe mantenerse visible y en su posición inferior.
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
    return Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              // se redondean solamente los bordes superiores
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              // Sombra alrededor del dock
              color: BrandColors.pastelPurple.value,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: NavigationBar(
          backgroundColor: BrandColors.whitePurple.value,
          indicatorColor: BrandColors.pastelPurple.value,
          selectedIndex: widget.selectedIndex,
          onDestinationSelected: widget.onItemTapped,
          labelBehavior: NavigationDestinationLabelBehavior
              .onlyShowSelected, // Reemplaza a  -> type: BottomNavigationBarType.shifting,
          indicatorShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          // showSelectedLabels: true,
          destinations: [
            _buildNavItem(Icons.home_rounded, Icons.home_outlined, 'Inicio', 0),
            _buildNavItem(Icons.shopping_bag_rounded,
                Icons.shopping_bag_outlined, 'Productos', 1),
            _buildNavItem(Icons.shopping_cart_rounded,
                Icons.shopping_cart_outlined, 'Carrito', 2),
            _buildNavItem(
                Icons.person_2_rounded, Icons.person_2_outlined, 'Perfil', 3),
          ],
        ));
  }

  NavigationDestination _buildNavItem(
      IconData iconSelected, IconData iconUnselected, String label, int index) {
    return NavigationDestination(
      selectedIcon: Icon(iconSelected),
      icon: Icon(iconUnselected),
      label: label,
      tooltip: label,
    );
  }
}
