import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/controllers/signup.dart';

class ProgressBar extends StatelessWidget {
  final ProgressController controller;

  const ProgressBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double totalWidth =
        MediaQuery.of(context).size.width; // Ancho total de la pantalla
    double sectionWidth = totalWidth / 4; // Divide el ancho en 3 partes
    return Stack(
      children: [
        Container(
          width: totalWidth,
          height: 20,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).appBarTheme.backgroundColor,
          ),
        ),
        // Barra de progreso animada
        Obx(() => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: sectionWidth * controller.progress.value * 4,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    right:
                        Radius.circular(controller.progress.value < 1 ? 8 : 0)),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            )),
      ],
    );
  }
}

// Controlador de estado con GetX
