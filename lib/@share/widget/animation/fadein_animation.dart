import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FadeinAnimation extends StatefulWidget {
  const FadeinAnimation(
      {Key? key,
      required this.delay,
      required this.child,
      this.duration = 500,
      this.from = 50})
      : super(key: key);
  final Widget child;
  final double from;
  final int delay;
  final int duration;
  @override
  State<FadeinAnimation> createState() => _FadeinAnimationState();
}

class _FadeinAnimationState extends State<FadeinAnimation> {
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
        from: widget.from,
        delay: Duration(milliseconds: widget.delay),
        duration: Duration(milliseconds: widget.duration),
        child: widget.child);
  }
}
