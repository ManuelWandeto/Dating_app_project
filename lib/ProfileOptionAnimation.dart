import 'package:flutter/material.dart';
import 'package:flirtr/FilterPageEnterAnimation.dart';
import 'package:flirtr/AppWidgets/ProfileOption.dart';

class ProfileOptionAnimation extends StatelessWidget {
  ProfileOptionAnimation({this.optionText, this.animation, this.beginAt, this.endAt});

  final FilterPageEnterAnimation animation;
  final String optionText;
  final double beginAt;
  final double endAt;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation.buildTitleOpacity(beginAt, endAt, Curves.decelerate),
          child: FractionalTranslation(
            translation: animation.buildFractionalTranslation(Curves.decelerate, beginAt, endAt).value,
            child: ProfileOption(
              optionText: optionText,
            ),
          ),
        );
      },
    );
  }
}
