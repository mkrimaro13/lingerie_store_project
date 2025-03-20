import 'package:flutter/material.dart';

/// Página de inicio que solamente tiene el logo de la marca
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Image.asset(
        Theme.of(context).brightness == Brightness.dark
            ? 'lib/images/logo2-white.png'
            : 'lib/images/logo2.png',
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
