import 'package:flutter/material.dart';
import 'package:flirtr/eclipsePainter.dart';

class IconBubbleWidget extends StatelessWidget {
  IconBubbleWidget({
    this.icon,
    this.widgetSize = const Size(30.0, 30.0),
    this.yAlign = -.25,
    this.xAlign = 0,
    this.iconSize = 15.0,
    this.widgetColor = const Color(0xffD19690),
  });

  final Size widgetSize;
  final IconData icon;
  final double yAlign;
  final double xAlign;
  final Color widgetColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: EclipsePainter(
        fillColor: widgetColor,
      ),
      child: Container(
        width: widgetSize.width,
        height: widgetSize.height,
        child: Align(
          alignment: Alignment(xAlign, yAlign),
          child: Icon(
            icon,
            size: iconSize,
            color: Color(0xff0A0D09),
          ),
        ),
      ),
    );
  }
}
