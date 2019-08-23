import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class CustomCheckBox extends StatelessWidget {
  final String animation;
  final Function onPressed;
  CustomCheckBox({this.onPressed, this.animation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:  Container(
        width: 20.0,
        height: 20.0,
        child: FlareActor(
          'assets/Checkbox.flr',
          animation: animation,
        ),
      ),
    );
  }

}

