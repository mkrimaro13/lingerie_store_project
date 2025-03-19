import 'package:flutter/material.dart';
import 'package:lingerie_store_project/models/product_model.dart';

/// https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html
/// Esta clase permite notificar cambios a las clases que la "escuchan", es decir que la usan.
class CartProvider extends ChangeNotifier {
  final List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  /// El notifier es el encargado de notificar a los widgets que estén escuchando
  /// que algo ha cambiado, en este caso, la lista de productos.
  void addProduct(ProductModel product) {
    _products.add(product);
    notifyListeners(); // Notifica a la UI que el carrito ha cambiado
  }

  void removeProduct(ProductModel product) {
    _products.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _products.clear();
    notifyListeners();
  }

  int get totalPrice =>
      _products.fold(0, (total, product) => total + product.price);
}
