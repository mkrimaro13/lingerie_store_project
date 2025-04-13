import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/views/products/grid.dart';
import 'package:lingerie_store_project/views/products/list.dart';
import 'package:lingerie_store_project/widgets/main_layout/upper_bar.dart';

/// Se cambia el método [setState(){}] para usar la librería [GetX]
/// https://github.com/jonataslaw/getx/blob/master/documentation/en_US/state_management.md#state-management
/// Principalmente para la gestión de estados de manera mas eficiente.
/// [setState ]reconstruye todo el Widget, aunque solo cambie una cosa.
/// [GetX] solo reconstruye lo que cambia.
/// Adicionalmente, permite integrar programación reactiva ( que podrá servir
/// para luego cuando se integre la api ) de manera mas simple.
///
/// Funcionamiento -> Se agrega un observable en la variable o en lo que
/// se necesite observar, en este [Widget] se requiere observar el valor de
/// [isGridView] por lo tanto se le agrega [.obs] al valor inicializado
/// quedando
/// ```dart
/// final isGridView = true.obs;
/// ```
/// Y luego en los lugares donde el valor va a cambiar se envuelve en un método
/// toda la función que cambia el valor de una variable
///
///```dart
/// Obx(() => isGridView.value? const ProductsGridView(products: products): const ProductsListView(products: products))
///```
///Y así se tiene el Provider y el Notifier de manera mas simple para gestionar estados
///Y mas eficiente que `setState`.

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isGridView = true.obs;
    return Stack(
      children: [
        /// Se asigna un espacio en la parte superior del elemento
        /// Ya que [Stack] superpone todos los elementos, entonces,
        /// es necesario tener este espacio para que el diseño
        /// sea agradable a la vista.
        Positioned.fill(
          top: kMinInteractiveDimension,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
            ), // Desactiva que se muestre la barra de desplazamiento
            /// Se crea un observador para cuando el valor de la variable cambie.
            /// Sin necesidad de un [Provider]
            child: Obx(
              () => isGridView.value
                  ? const ProductsGridView(products: products)
                  : const ProductsListView(products: products),
            ),
          ),
        ),

        /// Este Widget debe estar en esta posición para que el efecto de la "sombra"

        /// Se crea un Widget que "simula" ser una barra superior
        /// para tener opciones necesarias en la vista de productos.
        ExtraUpperbar(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              tooltip: 'Ordenar los productos',
              onPressed: () {},
              icon: const Icon(Icons.sort_rounded),
            ),
            Row(
              children: [
                IconButton(
                  tooltip: 'Filtrar los productos',
                  icon: const Icon(Icons.filter_list_rounded),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text('Filter options here'),
                      ),
                    );
                  },
                ),
                IconButton(
                  tooltip: 'Cambiar la vista',
                  icon: Obx(
                    () => isGridView.value
                        ? Icon(Icons.view_list_rounded)
                        : Icon(Icons.grid_view_rounded),
                  ),
                  onPressed: () => isGridView.value = !isGridView.value,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
