import 'package:flutter/material.dart';

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
      return 170;
    case <= 400:
      return 180;
    default:
      return 180;
  }
}

/// Método para calcular el ancho de acuerdo al ancho de la pantalla del contexto.
double getWidth(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  switch (screenWidth) {
    case <= 370:
      return 170;
    case <= 400:
      return 180;
    default:
      return 180;
  }
}

/// Método para calcular el espaciado de acuerdo al ancho de la pantalla del contexto
double getSpacing(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  switch (screenWidth) {
    case < 380:
      return 0;
    default:
      return 8;
  }
}

int getCrossAxisCount(BuildContext context) {
  //De acuerdo al tamaño de pantalla.
  double screenWidth = MediaQuery.sizeOf(context).width;

  switch (screenWidth) {
    case < 600:
      return 2;
    case < 900:
      return 3;
    default:
      return 4;
  }
}
