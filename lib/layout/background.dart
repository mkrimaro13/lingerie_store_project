import 'package:flutter/material.dart';

class SpecialBackground extends StatelessWidget {
  final Widget child;

  const SpecialBackground({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
          //  [Colors.blue[100]!, Colors.pink[100]!],
          [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
