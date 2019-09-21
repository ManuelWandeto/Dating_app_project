import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:flirtr/presentation/app_bar_icons_icons.dart';

class NextSectionIndicator extends StatelessWidget {
  NextSectionIndicator({this.beginSize = 26.0, this.endSize = 30.0});

  final double beginSize;
  final double endSize;
  @override
  Widget build(BuildContext context) {
    return Animator(
      tweenMap: <String, Tween>{
        'AnimateOpacity':
        Tween<double>(begin: .4, end: 1.0),
        'AnimateSize':
        Tween<double>(begin: beginSize, end: endSize),
        'AnimateTranslate': Tween<Offset>(
            begin: Offset(-0.65, 0), end: Offset(0, 0)),
      },
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOutBack,
      cycles: 0,
      builderMap: (anim) {
        return FadeTransition(
          opacity: anim['AnimateOpacity'],
          child: FractionalTranslation(
            translation: anim['AnimateTranslate'].value,
            child: Icon(
              AppBarIcons.right_arrow,
              color: Color(0xffEDF4ED).withOpacity(.60),
              size: anim['AnimateSize'].value,
            ),
          ),
        );
      },
    );
  }
}