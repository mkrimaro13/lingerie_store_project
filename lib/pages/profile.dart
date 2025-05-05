import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/pages/signin.dart';
import 'package:lingerie_store_project/pages/signup.dart';
import 'package:lingerie_store_project/widgets/buttons/extended.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: Icon(
              Icons.person,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            "Bienvenid@",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("Accede a tu cuenta o crea una nueva"),
          _buildButton(
            context,
            text: "Iniciar Sesión",
            color: Colors.deepPurpleAccent[100]!,
            onPressed: () {
              Get.to(() => SigninPage());
            },
          ),
          _buildButton(
            width: 225,
            context,
            text: "Crear Cuenta",
            color: Colors.blueAccent[100]!,
            onPressed: () {
              Get.to(() => SignupPage());
            },
          ),
        ],
      ),
      // ),
      // ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    double? width,
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
        width: width ?? 250,
        height: 50,
        child: ExtendedButton(
            onPressed: onPressed, backgroundColor: color, buttonLabel: text));
  }
}
