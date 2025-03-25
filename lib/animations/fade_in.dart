import 'package:flutter/material.dart';

/// Animación de desvanecimiento.
class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final int? milliseconds;

  const FadeInAnimation({super.key, required this.child, this.milliseconds});

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: widget.milliseconds ?? 1000),
      curve: Curves.easeInOut,
      opacity: _opacity,
      child: widget.child,
    );
  }
}
