import 'dart:developer';

import 'package:flutter/material.dart';

class MainFloatingActionButton extends StatelessWidget {
  final int color;
  const MainFloatingActionButton({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(color),
      child: Icon(Icons.add),
      onPressed: () {
        log('FAB Pressed');
      },
    );
  }
}
