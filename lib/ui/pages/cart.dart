import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lingerie_store_project/ui/widgets/cart_page/cart_card.dart';
import 'package:lingerie_store_project/ui/widgets/cart_page/cart_provider.dart';
import 'package:lingerie_store_project/ui/widgets/buttons/extended_button.dart';
import 'package:lingerie_store_project/ui/widgets/extra_upperbar.dart';
import 'package:provider/provider.dart';

// class ProductsCartPage extends StatefulWidget {
class ProductsCartPage extends StatelessWidget {
  const ProductsCartPage({super.key});

//   @override
//   State<ProductsCartPage> createState() => _ProductsCartPageState();
// }

// class _ProductsCartPageState extends State<ProductsCartPage> {
  @override
  Widget build(BuildContext context) {
    /// Se crea un [Provider] para obtener los productos que van a estar en el carrito.
    /// Este provider se encarga traer los productos de la página de productos hacía el carrito.
    final cart =
        Provider.of<CartProvider>(context); // Obtiene los productos del carrito

    return cart.products.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(
                Icons.shopping_bag_rounded,
                size: 80.0,
              ),
              Text(
                'Vacío...\nPor ahora ;)',
                textAlign: TextAlign.center,
              )
            ],
          )
        : Stack(
            children: [
              ExtraUpperbar(
                children: [
                  Text(cart.products.length == 1
                      ? 'Producto en el carrito'
                      : 'Productos en el carrito'),
                  Text('Total: \$${cart.totalPrice.toStringAsFixed(2)}'),
                ],
              ),
              Positioned.fill(
                top: kMinInteractiveDimension + 4,
                // Importante para evitar errores de tamaño
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(8.0),
                  itemCount: cart.products.length,
                  itemBuilder: (context, index) => CartCard(
                      product: cart.products[index],
                      onPressed: () {
                        log('Removed ${cart.products[index].productName} from cart');
                        cart.removeProduct(cart.products[index]);
                      },
                      buttonLabel: 'Eliminar del carrito'),
                ),
              ),
              Positioned.fill(
                  bottom: (MediaQuery.of(context).size.height) - 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ExtendedButton(
                        buttonLabel: 'Limpiar el carrito',
                        onPressed: () {
                          log('Se ha limpiado el carrito');
                          cart.clearCart();
                        },
                      ),
                      ExtendedButton(
                        buttonLabel: 'Ir a pagar',
                        onPressed: () {
                          log(MediaQuery.of(context).size.height.toString());
                          log('Procediendo a pagar');
                        },
                      )
                    ],
                  ))
            ],
          );
  }
}
