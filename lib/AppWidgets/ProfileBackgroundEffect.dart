import 'package:flutter/material.dart';

class BackgroundEffectLayer extends StatelessWidget {
  const BackgroundEffectLayer({this.fadeController});

  final AnimationController fadeController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                colors: [
                  Color(0xff0A0D09).withOpacity(.45),
                  Color(0xff0A0D09).withOpacity(.05),
                  Color(0xff0A0D09).withOpacity(0.0),
                ],
                stops: [
                  0.0,
                  0.5,
                  1.0,
                ]),
          ),
        ),
        FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 0.9,
          ).animate(
            CurvedAnimation(
                curve: Interval(
                  0.0,
                  0.50,
                  curve: Curves.decelerate,
                ),
                parent: fadeController),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                  colors: [
                    Color(0xff0A0D09).withOpacity(.90),
                    Color(0xff0A0D09).withOpacity(.50),
                  ],
                  stops: [
                    0.0,
                    1.0,
                  ]),
            ),
          ),
        )
      ],
    );
  }
}