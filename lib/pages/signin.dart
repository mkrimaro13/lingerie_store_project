import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    // UserModel testUser =
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(Icons.person),
              const Text("Hola."),
            ],
          ),
          const Text("Iniciar Sesión"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implementar la lógica de inicio de sesión aquí
            },
            child: const Text("Iniciar Sesión"),
          ),
        ],
      ),
    );
  }
}
