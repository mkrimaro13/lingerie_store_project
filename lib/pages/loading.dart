import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/layout/main_layout.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(Duration(seconds: 3), () {
        /// `Get.off()` permite ir a una página siguiente, sin posibilidad de
        /// volver hacía atrás
        Get.off(() => RepaintBoundary(child: MainLayout()));
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/images/icons/icon_erotic_woman.png'),
              SizedBox(height: 16),
              Text(
                'Cargando...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              CircularProgressIndicator(
                color: Theme.of(context)
                    .appBarTheme
                    .titleTextStyle
                    ?.color, // Indicador de carga blanco
              ),
            ],
          ),
        ),
      ),
    );
  }
}
