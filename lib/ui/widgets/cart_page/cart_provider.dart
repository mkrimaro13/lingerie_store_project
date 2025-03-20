import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
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


/// Se reescribe utilizando la librería [GetX] al igual que la
/// vista de productos, usa la misma lógica que el [CartProvider]
/// Solamente que en lugar un [ChangeNotifier] y [Listener]s 
/// Se crea un método estático que mantiene la información activa
/// mientras sea necesario, es decir, se agregan objetos al carrito, 
/// y [CartController] se mantiene activo y en memoria mientras contenga 
/// información, esto se gestiona desde la vista que lo requiere en este caso
/// la creación o destrucción se realiza desde [ProductsCartPage].
class CartController extends GetxController {
  List<ProductModel> products = [];

  static CartController get to => Get.put(CartController());

  void addProduct(ProductModel product) {
    products.add(product);
    update();
  }

  void removeProduct(ProductModel product) {
    products.remove(product);
    update();
  }

  void clearCart() {
    products.clear();
    update();
  }

  int get totalPrice =>
      products.fold(0, (total, product) => total + product.price);
}
