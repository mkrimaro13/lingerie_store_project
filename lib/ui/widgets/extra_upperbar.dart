import 'package:flutter/material.dart';

class ExtraUpperbar extends StatelessWidget {
  /// Para que poder usar StatelessWidget y aún así usar un valor opcional
  /// Se puede indicar un valor por defecto en el constructor.

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  const ExtraUpperbar(
      {super.key,
      required this.children,
      this.mainAxisAlignment = MainAxisAlignment.spaceAround});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMinInteractiveDimension,
      width: MediaQuery.of(context).size.width - 10,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).appBarTheme.shadowColor!,
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            ...children, // Spread operator como en JavaScript.
          ],
        ),
      ),
    );
  }
}
