import 'package:flutter/material.dart';

class SlideFromBottom extends StatefulWidget {
  final Widget child;
  final double? beginOffsetY;
  final double? endOffsetY;
  final int? milliseconds;
  const SlideFromBottom(
      {super.key,
      required this.child,
      this.beginOffsetY,
      this.endOffsetY,
      this.milliseconds});

  @override
  State<SlideFromBottom> createState() => _SlideFromBottomState();
}

class _SlideFromBottomState extends State<SlideFromBottom>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(
          milliseconds: widget.milliseconds ??
              4000), // Controla la duración de la animación
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(
          1, widget.beginOffsetY ?? 1), // Starts off-screen at the bottom
      end: Offset(0, widget.beginOffsetY ?? 0), // Moves to its final position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
