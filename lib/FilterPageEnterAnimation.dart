import 'package:flutter/material.dart';
import 'dart:math' as math;

class FilterPageEnterAnimation {
  AnimationController controller;
  FilterPageEnterAnimation({this.controller});

  Animation<double> titleZrotation;
  Animation<double> titleOpacity;
  
  Animation<double> buildTitleZrotation(double begin, double end, Curve curve) {
    return Tween<double>(begin: (math.pi / 2), end: 0.0).animate(
      CurvedAnimation(
        curve: Interval(
          begin,
          end,
          curve: curve,
        ),
        parent: controller,
      ),
    );
  }

  Animation<double> buildTitleOpacity(double begin, double end, Curve curve) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        curve: Interval(
          begin,
          end,
          curve: curve,
        ),
        parent: controller,
      ),
    );
  }
}
