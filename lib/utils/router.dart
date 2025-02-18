import 'package:flutter/material.dart';
import 'package:lingerie_store_project/ui/pages/home.dart';
import 'package:lingerie_store_project/ui/pages/products.dart';

/// Componente de ruteo.
/// No es necesario ya que las rutas se gestionan desde
/// la barra de navegación inferior.
void navigateToScreen(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      break;
    case 1:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductsPage()));
      break;
    case 2:
      Navigator.pushNamed(context, '/profile');
      break;
  }
}
