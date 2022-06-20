import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  const FadeAnimation({
    Key? key,
    required this.delay,
    required this.child,
    this.duration = 500,
  }) : super(key: key);
  final Widget child;
  final int delay;
  final int duration;
  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
        delay: Duration(milliseconds: widget.delay),
        duration: Duration(milliseconds: widget.duration),
        child: widget.child);
  }
}
