import 'package:flutter/material.dart';

void navigateToScreen(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/');
      break;
    case 1:
      Navigator.pushNamed(context, '/shop');
      break;
    case 2:
      Navigator.pushNamed(context, '/profile');
      break;
  }
}
