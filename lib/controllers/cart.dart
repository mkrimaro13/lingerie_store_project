import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/models/product_model.dart';

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
