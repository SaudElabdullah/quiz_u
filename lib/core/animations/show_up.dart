import 'dart:async';

import 'package:flutter/material.dart';

class ShowUp extends StatefulWidget {
  final Widget? child;
  final int? delay;
  final int duration;

  const ShowUp({
    Key? key,
    this.delay,
    this.child,
    this.duration = 600,
  }) : super(key: key);

  @override
  State<ShowUp> createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animationOffset;
  late bool disposeAnimtion;

  @override
  void initState() {
    super.initState();

    disposeAnimtion = false;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.duration,
      ),
    );
    final curve = CurvedAnimation(
      curve: Curves.decelerate,
      parent: animationController,
    );
    animationOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.35),
      end: Offset.zero,
    ).animate(
      curve,
    );

    if (widget.delay == null) {
      animationController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay!), () {
        disposeAnimtion == false ? animationController.forward() : null;
      });
    }
  }

  @override
  void dispose() {
    disposeAnimtion = true;
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SlideTransition(
        position: animationOffset,
        child: widget.child,
      ),
    );
  }
}
