import 'package:flutter/material.dart';

class ProfilePageAnimation {
  ProfilePageAnimation({this.filtersPageController})
      : backdropAnimation = Tween<double>(begin: 0.0, end: 5.0).animate(
        CurvedAnimation(
            curve: Interval(0.0, 0.50, curve: Curves.decelerate),
            reverseCurve: Interval(0.0, 0.35, curve: Curves.decelerate),
            parent: filtersPageController),
      ),
      opacityAnimation = Tween<double>(
        begin: 1.0,
        end: 0.0,
      ).animate(
        CurvedAnimation(
            curve: Interval(0.0, 0.25, curve: Curves.easeOut),
            parent: filtersPageController),
      );

  AnimationController filtersPageController;

  Animation<double> backdropAnimation;

  Animation<double> opacityAnimation;



}