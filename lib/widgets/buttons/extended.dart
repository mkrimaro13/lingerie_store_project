import 'package:flutter/material.dart';

class ExtendedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final String buttonLabel;

  const ExtendedButton(
      {super.key,
      this.backgroundColor,
      this.onPressed,
      required this.buttonLabel});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        // foregroundColor: Theme.of(context).accentColor,
      ),
      onPressed: onPressed,
      child: Text(
        buttonLabel,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
