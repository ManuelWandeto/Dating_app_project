import 'package:flutter/material.dart';
import 'package:flirtr/FilterPageEnterAnimation.dart';
import 'package:flirtr/AppWidgets/ProfileOption.dart';
import 'package:flirtr/AppWidgets/FractionalTranslateWidget.dart';

class ProfileOptionAnimation extends StatelessWidget {
  ProfileOptionAnimation({this.optionText, this.animation, this.beginAt, this.endAt});

  final FilterPageEnterAnimation animation;
  final String optionText;
  final double beginAt;
  final double endAt;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslateWidget(
      animation: animation,
      beginAt: beginAt,
      endAt: endAt,
      child: ProfileOption(optionText: optionText,),
    );
  }
}
