import 'package:flutter/material.dart';

// La paleta de colores que mas se va a usar.
enum BrandColors {
  transparent(
    Color.fromARGB(0, 255, 255, 255),
  ),
  white(Color.fromRGBO(251, 251, 251, 1)),
  pastelPurple(Color(0xFFC5BAFF)),
  whitePurple(Color(0xffF5EFFF)),
  pastelBlue(Color(0xFFC4D9FF));

  final Color value;
  const BrandColors(this.value);
}
