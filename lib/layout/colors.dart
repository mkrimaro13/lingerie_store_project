import 'package:flutter/material.dart';

// La paleta de colores que mas se va a usar.
enum BrandColors {
  transparent(
    Color.fromARGB(0, 255, 255, 255),
  ),
  appBarColor(Color(0xFFFFEDFA)),
  brandPastelPurple1(Color(0xFFC5BAFF)),
  brandPastelBlue(Color(0xFFC4D9FF)),
  brandPastelPurple2(Color(0xFFC5BAFF)),
  brandPastelPurple3(Color(0xFFFCC6FF));

  final Color value;
  const BrandColors(this.value);
}
