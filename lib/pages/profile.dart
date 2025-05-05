import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/models/user_model.dart';
import 'package:lingerie_store_project/pages/signin.dart';
import 'package:lingerie_store_project/pages/signup.dart';
import 'package:lingerie_store_project/widgets/buttons/extended.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return testUser?.name == null
        ? _noLogin(context)
        : _login(context, testUser!);
  }

  Widget _noLogin(BuildContext context) {
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

  Widget _login(BuildContext context, UserModel user) {
    return Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text("¡Hola de nuevo ${user.name}!",
                  style: TextStyle(fontSize: 24)),
            ]),
        ListTile(
          leading: const Icon(Icons.shopping_bag_outlined),
          title: const Text('Mis Pedidos'),
          // onTap: onSeeOrders,
        ),
        ListTile(
          leading: const Icon(Icons.favorite_border_outlined),
          title: const Text('Mis Listas de Deseos'),
          // onTap: onSeeWishlists,
        ),
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text('Mi Perfil'),
          onTap: () {
            Get.to(() => MyProfilePage());
          },
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: const Divider()),
        ExtendedButton(buttonLabel: "Cerrar Sesión", onPressed: () {}),
      ],
    );
  }
}

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mi Perfil"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: Icon(
                Icons.person,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: const Divider()),
            Text(
              "Nombres: ${testUser?.name}",
            ),
            Text(
              "Apellidos: ${testUser?.lastName}",
            ),
            Text(
              "Cumpleaños: ${testUser?.birthDay ?? "No registrado por ahora"}",
            ),
            Text(
              "Género: ${testUser?.genre}",
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: const Divider()),
            Text(
              "Correo: ${testUser?.email}",
              softWrap: true,
            ),
            Text(
              "Télefono: ${testUser?.phoneNumber}",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: const Divider(),
            ),
            Row(
              spacing: 24,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExtendedButton(
                  buttonLabel: "Cerrar Sesión",
                  onPressed: () {
                    // Get.offAll(() => SigninPage());
                  },
                ),
                ExtendedButton(
                  buttonLabel: "Volver",
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            ),
          ]),
        ));
  }
}
