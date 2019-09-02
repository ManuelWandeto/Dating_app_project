import 'package:flutter/material.dart';
import 'package:flirtr/eclipsePainter.dart';

class IconBubbleWidget extends StatelessWidget {
  IconBubbleWidget({this.icon, this.widgetSize, this.yAlign = -.25});

  final Size widgetSize;
  final IconData icon;
  final double yAlign;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: EclipsePainter(fillColor: Color(0xffD19690),),
      child: Container(
        width: widgetSize.width,
        height: widgetSize.height,
        child: Align(
          alignment: Alignment(0, yAlign),
          child: Icon(icon, size: 15.0, color: Color(0xff0A0D09),),
        ),
      ),
    );
  }
}