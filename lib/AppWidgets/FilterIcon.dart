import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({@required this.filterAnimation, this.onPressed});

  final String filterAnimation;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: Theme.of(context).appBarTheme.iconTheme.size,
        height: Theme.of(context).appBarTheme.iconTheme.size,
        child: FlareActor(
          "assets/filter_icon_animation.flr",
          color: Theme.of(context).appBarTheme.iconTheme.color,
          animation: filterAnimation,
        ),
      ),
    );
  }
}