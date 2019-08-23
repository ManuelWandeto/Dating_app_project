import 'package:flutter/material.dart';

class StrokedRangeSliderThumbShape extends RangeSliderThumbShape {
  const StrokedRangeSliderThumbShape({
    this.strokeWidth,
    this.fillColor,
    this.strokeColor,
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
  }) : assert(enabledThumbRadius != null);

  final double enabledThumbRadius;
  final Color strokeColor;
  final Color fillColor;
  final double strokeWidth;
  final double disabledThumbRadius;
  double get _disabledThumbRadius =>  disabledThumbRadius ?? enabledThumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center, {Animation<double> activationAnimation, Animation<double> enableAnimation, bool isDiscrete, bool isEnabled, bool isOnTop, TextDirection textDirection, SliderThemeData sliderTheme, Thumb thumb}) {
    assert(context != null);
    assert(center != null);
    assert(sliderTheme != null);
    final Canvas canvas = context.canvas;
    final double radius = enabledThumbRadius;

    //Paint object to use in drawing stroke of specified width around the thumb
    final Paint strokePaint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, strokePaint);
    canvas.drawCircle(
      center,
      radius,
      Paint()..color = fillColor,
    );
  }


}
