import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/controllers/cart.dart';
import 'package:lingerie_store_project/views/cart/card.dart';

// class ProductsCartPage extends StatefulWidget {
class ProductsCartPage extends StatelessWidget {
  const ProductsCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// Se usa un [Builder] del controlador.
    /// Se envuelve todo el control de los [Widget]s dentro del [Builder].
    /// En el `init` se inicializa el [CartController] al ingresar a la
    /// página se crea/carga el objeto, si no tiene información se
    /// elimina y se libera ese espacio de la memoria.
    /// Pero si tiene información (ya que es un método estático) almacena
    /// se vuelve persistente, mientras tenga información almacenada.
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) => controller.products.isEmpty
            ? noProductsWidget(context)
            : productsWidget(context, controller));
  }
}

Widget noProductsWidget(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 10,
    children: [
      Icon(Icons.shopping_bag_rounded, size: 80.0),
      Text(
        'Vacío...\nPor ahora ;)',
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget productsWidget(BuildContext context, CartController controller) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        '${controller.products.length == 1 ? 'Un producto en el carrito' : 'Productos en el carrito'} Total: \$${controller.totalPrice.toStringAsFixed(2)}',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    ),
    body: ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(8.0),
      itemCount: controller.products.length,
      itemBuilder: (context, index) => CartCard(
        product: controller.products[index],
        onPressed: () {
          Get.snackbar(
            "Producto eliminado del carrito 😔",
            "Tal vez no era de tu gusto 🤷‍♀️",
          );
          log(
            'Removed ${controller.products[index].productName} from cart',
          );
          controller.removeProduct(
            controller.products[index],
          );
        },
        buttonLabel: 'Eliminar del carrito',
      ),
    ),
  );
}
