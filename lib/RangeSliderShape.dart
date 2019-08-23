import 'package:flutter/material.dart';

class StrokedRangeSliderThumbShape extends RangeSliderThumbShape {
  /// Create a slider thumb that draws a circle.
  const StrokedRangeSliderThumbShape({
    this.strokeWidth,
    this.fillColor,
    this.strokeColor,
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
  }) : assert(enabledThumbRadius != null);

  /// The preferred radius of the round thumb shape when the slider is enabled.
  ///
  /// If it is not provided, then the material default of 10 is used.
  final double enabledThumbRadius;
  final Color strokeColor;
  final Color fillColor;
  final double strokeWidth;

  /// The preferred radius of the round thumb shape when the slider is disabled.
  ///
  /// If no disabledRadius is provided, then it is equal to the
  /// [enabledThumbRadius].
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
