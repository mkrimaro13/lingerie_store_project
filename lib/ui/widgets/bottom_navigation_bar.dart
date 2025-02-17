import 'package:flutter/material.dart';

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
  // Widget build(BuildContext context) {
  //   return BottomNavigationBar(
  //     enableFeedback: true,
  //     backgroundColor: BrandColors.appBarColor.value,
  //     selectedItemColor: Colors.black87,
  //     unselectedItemColor: Colors.black45,
  //     currentIndex: widget.selectedIndex,
  //     onTap: widget.onItemTapped,
  //     // [fixed] Permite mostrar todos los [Icon]s y su [label] al mismo tiempo.
  //     // [shifting] Muestra todos los [Icon]s, pero solo el [label] del que esté seleccionado.
  //     type: BottomNavigationBarType.shifting,
  //     selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
  //     showSelectedLabels: true,
  //     items: [
  //       _buildNavItem(Icons.home_rounded, 'Home', 0),
  //       _buildNavItem(Icons.shopping_bag_rounded, 'Products', 1),
  //       _buildNavItem(Icons.shopping_cart_rounded, 'Cart', 2),
  //       _buildNavItem(Icons.person_2_rounded, 'Profile', 3),
  //     ],
  //   );
  // }

  // BottomNavigationBarItem _buildNavItem(
  //     IconData icon, String label, int index) {
  //   return BottomNavigationBarItem(
  //     icon: Icon(icon),
  //     label: label,
  //     tooltip: label,
  //   );
  // }
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: 5, right: 10, left: 10), // Lifts the BottomAppBar
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Rounded corners
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black26,
        //     blurRadius: 10, // Soft shadow
        //     spreadRadius: 2,
        //     offset: Offset(0, 4), // Shadow below
        //   ),
        // ],
      ),
      child: BottomAppBar(
        // color: BrandColors.transparent.value,
        shape: CircularNotchedRectangle(), // For FloatingActionButton notch
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_rounded, 'Home', 0),
            _buildNavItem(Icons.shopping_bag_rounded, 'Products', 1),
            _buildNavItem(Icons.shopping_cart_rounded, 'Cart', 2),
            _buildNavItem(Icons.person_2_rounded, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return Expanded(
      child: IconButton(
        icon: Icon(icon,
            color: widget.selectedIndex == index
                ? Colors.black87
                : Colors.black45),
        tooltip: label,
        onPressed: () => widget.onItemTapped(index),
      ),
    );
  }
}
