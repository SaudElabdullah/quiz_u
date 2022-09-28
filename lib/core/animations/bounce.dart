import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bounce extends StatefulWidget {
  final Widget child;
  final Function function;

  const Bounce({Key? key, required this.child, required this.function,}) : super(key: key);

  @override
  State<Bounce> createState() => _BounceState();
}

class _BounceState extends State<Bounce> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.2,
    )
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTap: (){
        widget.function();
      },
      child: Transform.scale(
        scale: 1 - _controller.value,
        child: widget.child,
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    HapticFeedback.heavyImpact();
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
