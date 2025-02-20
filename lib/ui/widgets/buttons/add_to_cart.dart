import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/colors.dart';

class CustomButtonAddToCart extends StatefulWidget {
  final VoidCallback onPressed;
  const CustomButtonAddToCart({super.key, required this.onPressed});

  @override
  State<CustomButtonAddToCart> createState() => _CustomButtonAddToCart();
}

class _CustomButtonAddToCart extends State<CustomButtonAddToCart> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(20, 40),
          backgroundColor: BrandColors.whitePurple.value,
          foregroundColor: Color(0xFF1A1A1D)),
      onPressed: widget.onPressed,
      child: Text('Agregar al carrito'),
    );
  }
}
