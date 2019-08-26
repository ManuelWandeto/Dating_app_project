import 'package:flutter/material.dart';
import 'package:flirtr/FilterPageEnterAnimation.dart';

class FractionalTranslateWidget extends StatefulWidget {

  FractionalTranslateWidget({this.animation, this.beginAt, this.endAt, this.child});

  final FilterPageEnterAnimation animation;
  final double beginAt;
  final double endAt;
  final Widget child;

  @override
  _FractionalTranslateWidgetState createState() => _FractionalTranslateWidgetState();
}

class _FractionalTranslateWidgetState extends State<FractionalTranslateWidget> {
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
        return FadeTransition(
          opacity: animation.buildTitleOpacity(widget.beginAt, widget.endAt, Curves.decelerate),
          child: FractionalTranslation(
            translation: animation.buildFractionalTranslation(Curves.decelerate, widget.beginAt, widget.endAt).value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
