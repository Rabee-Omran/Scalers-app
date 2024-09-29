import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomFadeInDown extends StatelessWidget {
  const CustomFadeInDown({
    required this.child,
    this.duration = 300,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}

class CustomFadeInUp extends StatelessWidget {
  const CustomFadeInUp({
    required this.child,
    this.duration = 300,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}

class CustomFadeInLeft extends StatelessWidget {
  const CustomFadeInLeft({
    required this.child,
    this.duration = 300,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return Directionality.of(context) == TextDirection.rtl
        ? FadeInLeft(
            duration: Duration(milliseconds: duration),
            child: child,
          )
        : FadeInRight(
            duration: Duration(milliseconds: duration),
            child: child,
          );
  }
}

class CustomFadeInRight extends StatelessWidget {
  const CustomFadeInRight({
    required this.child,
    this.duration = 300,
    super.key,
  });

  final Widget child;

  final int duration;

  @override
  Widget build(BuildContext context) {
    return Directionality.of(context) == TextDirection.rtl
        ? FadeInRight(
            duration: Duration(milliseconds: duration),
            child: child,
          )
        : FadeInLeft(
            duration: Duration(milliseconds: duration),
            child: child,
          );
  }
}
