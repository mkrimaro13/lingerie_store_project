import 'package:flutter/material.dart';

// class MediaqueryMeasures {
//   BuildContext context;
//     double screenWidth = MediaQuery.of(context).size.width;

// }

double getPadding(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  switch (screenWidth) {
    case > 900:
      return 400;
    default:
      return 5;
  }
}

/// Método para calcular el alto de acuerdo al ancho de la pantalla del contexto.
double getHeight(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  switch (screenWidth) {
    case <= 370:
      return 150;
    case <= 400:
      return 170;
    case <= 500:
      return 190;
    case <= 800:
      return 220;
    case <= 900:
      return 210;
    default:
      return 215;
  }
}

/// Método para calcular el ancho de acuerdo al ancho de la pantalla del contexto.
double getWidth(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  switch (screenWidth) {
    case < 370:
      return 130;
    case < 400:
      return 150;
    case < 600:
      return 160;
    case < 700:
      return 200;
    case < 800:
      return 250;
    case < 900:
      return 190;
    default:
      return 215;
  }
}

/// Método para calcular el espaciado de acuerdo al ancho de la pantalla del contexto
double getSpacing(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  switch (screenWidth) {
    case < 370:
      return 5;
    case < 400:
      return 10;
    case < 500:
      return 15;
    case < 600:
      return 10;
    case < 700:
      return 100;
    case < 800:
      return 150;
    case < 900:
      return 200;
    default:
      return 50;
  }
}
