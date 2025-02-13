import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/main_layout.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          child: InkWell(
            onTap: () {
              log('Logo clicked');
            },
            child: Image.asset(
              'lib/images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () {
              log('button pressed');
              Navigator.pushNamed(context, '/Products');
            },
            child: Text('Go to Products View'))
      ],
    );
  }
}
