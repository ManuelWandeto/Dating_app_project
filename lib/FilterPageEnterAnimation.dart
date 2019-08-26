import 'package:flutter/material.dart';
import 'dart:math' as math;

class FilterPageEnterAnimation {
  AnimationController controller;
  FilterPageEnterAnimation({this.controller});

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

  Animation<Offset> buildFractionalTranslation(
      Curve curve, double startAt, double endAt) {
    return Tween<Offset>(
      begin: Offset(0.20, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(startAt, endAt, curve: curve),
      ),
    );
  }

  Animation<double> buildSliderScaleAnimation(double beginAt, double endAt) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        reverseCurve: Interval(
          beginAt,
          endAt,
          curve: Curves.decelerate,
        ),
        curve: Interval(
          beginAt,
          endAt,
          curve: Curves.elasticOut,
        ),
      ),
    );
  }
}
