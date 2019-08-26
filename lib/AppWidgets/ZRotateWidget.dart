import 'package:flutter/material.dart';
import 'package:flirtr/FilterPageEnterAnimation.dart';

class ZRotateWidget extends StatefulWidget {
  ZRotateWidget({this.animation, this.child, this.beginAt, this.endAt});

  final Widget child;
  final FilterPageEnterAnimation animation;
  final double beginAt;
  final double endAt;
  @override
  _ZRotateWidgetState createState() => _ZRotateWidgetState();
}

class _ZRotateWidgetState extends State<ZRotateWidget> {
  FilterPageEnterAnimation animation;

  @override
  void initState() {
    animation = widget.animation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.rotationX(animation
              .buildTitleZrotation(
            0.40,
            0.70,
            Curves.decelerate,
          )
              .value),
          child: FadeTransition(
            opacity: animation.buildTitleOpacity(
              0.40,
              0.70,
              Curves.easeIn,
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
