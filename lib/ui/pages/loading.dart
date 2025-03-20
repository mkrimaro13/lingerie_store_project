import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/main_layout.dart'; // Tu pantalla principal

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  /// Para este caso se requiere un estado para poder
  /// establecer un temporizador de forma automática y luego redirigir
  /// a la interfaz general.
  @override
  void initState() {
    super.initState();
    // Simulamos una carga con un delay
    Timer(Duration(seconds: 1), () {
      // Navegar a la pantalla principal después de la carga
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SafeArea(child: const HomeScreen())),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, // Fondo morado pastel
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/icons/icon_erotic_woman.png'),
            // color: Colors.white, // Se adapta al color definido
            SizedBox(height: 16),
            Text(
              'Cargando...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(
              color: Theme.of(context)
                  .colorScheme
                  .secondary, // Indicador de carga blanco
            ),
          ],
        ),
      ),
    );
  }
}
