import 'package:flutter/material.dart';

class ExtendedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonLabel;

  const ExtendedButton({super.key, this.onPressed, required this.buttonLabel});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(20, 40),
        // backgroundColor: Theme.of(context).elevatedButtonTheme,
        // foregroundColor: Theme.of(context).accentColor,
      ),
      onPressed: onPressed,
      child: Text(
        buttonLabel,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
