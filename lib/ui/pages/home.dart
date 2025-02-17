import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/colors.dart';
import 'package:lingerie_store_project/utils/animations/fade_in.dart';

/// Página dinámica que tiene dos animaciones
/// Solamente tiene la imagen del logo.
/// La animación se debe ejecutar cada vez que se cargue la página.
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: BrandColors.transparent.value,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInAnimation(
                  milliseconds: 1000,
                  child: ClipRRect(
                    child: InkWell(
                      onTap: () {
                        log('Logo clicked');
                      },
                      child: Image.asset(
                        'lib/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            ]));
  }
}
