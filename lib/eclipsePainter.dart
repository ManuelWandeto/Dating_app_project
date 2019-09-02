import 'package:flutter/material.dart';
import 'dart:math' as math;
class EclipsePainter extends CustomPainter {
  EclipsePainter({this.fillColor});

  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint()
    ..color = fillColor;

    double radius = math.max(size.height / 2, size.width / 2);
    Offset origin = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(origin, radius, brush,);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}