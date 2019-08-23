import 'package:flutter/material.dart';
import 'dart:math' as math;

class FilterPageEnterAnimation {
  AnimationController controller;
  FilterPageEnterAnimation({this.controller})
      : titleZrotation = Tween<double>(begin: (math.pi/2), end: 0.0).animate(
          CurvedAnimation(
            curve: Interval(
              0.40,
              0.75,
              curve: Curves.decelerate,
            ),
            parent: controller,
          ),
        ),
        titleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            curve: Interval(
              0.40,
              0.75,
              curve: Curves.easeIn,
            ),
            parent: controller,
          ),
        );

  final Animation<double> titleZrotation;
  final Animation<double> titleOpacity;
}
