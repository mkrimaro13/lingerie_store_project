import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProgressController controller = Get.put(ProgressController());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 1,
        ),
        body: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProgressBar(
                controller: controller,
              ),
              Text('Creación de cuenta'),
              // Slider para modificar el progreso
              BottomBar(
                controller: controller,
              )
            ]));
  }
}

class BottomBar extends StatelessWidget {
  final ProgressController controller;

  const BottomBar({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          gradient: LinearGradient(
            colors:
                //  [Colors.blue[100]!, Colors.pink[100]!],
                [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.face),
              onPressed: () {
                controller.updateProgress(0);
                log(controller.progress.value.toString());
                log('face pressed');
              },
            ),
            Obx(() => IconButton(
                  icon: Icon(
                      controller.index.value == 1 || controller.index.value >= 1
                          ? Icons.mark_email_read_rounded
                          : Icons.mail_rounded),
                  onPressed: () {
                    controller.updateProgress(1);
                    log(controller.progress.value.toString());
                    log('mail_rounded pressed');
                  },
                )),
            Obx(() => IconButton(
                  icon: Icon(
                      controller.index.value == 2 || controller.index.value >= 2
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded),
                  onPressed: () {
                    controller.updateProgress(2);
                    log(controller.progress.value.toString());
                    log('favorite_outline_rounded pressed');
                  },
                )),
            Obx(() => IconButton(
                  icon: Icon(
                      controller.index.value == 3 || controller.index.value >= 3
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded),
                  onPressed: () {
                    controller.updateProgress(3);
                    log(controller.progress.value.toString());
                    log('favorite_outline_rounded pressed');
                  },
                )),
          ],
        ));
  }
}

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
class ProgressController extends GetxController {
  var progress = 0.25.obs; // Observa cambios en el progreso
  var index = 0.obs;

  final PageController pageController = PageController();

  final List<Widget> pages = [
    // HomePage(),
  ];

  void updateProgress(int selectedIndex) {
    if (index.value < selectedIndex) {
      progress.value =
          (progress.value + 0.25 * (selectedIndex - index.value).abs())
              .clamp(0.0, 1);
    } else if (index.value > selectedIndex) {
      progress.value =
          (progress.value - 0.25 * (selectedIndex - index.value).abs())
              .clamp(0.0, 1);
    }
    index.value = selectedIndex; // Actualiza el índice seleccionado
    log('Índice actual: ${index.value}');
    log('Progreso actual: ${progress.value}');
  }
}
