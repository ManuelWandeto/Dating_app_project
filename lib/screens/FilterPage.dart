import 'package:flutter/material.dart';
import 'package:flirtr/FilterPageEnterAnimation.dart';
import 'package:flirtr/AppWidgets/ProfileOption.dart';
import 'package:flirtr/AppWidgets/AgeRangeSection.dart';
import 'package:flirtr/AppWidgets/DistanceSection.dart';

class FilterPage extends StatefulWidget {
  final AnimationController filterPageController;

  FilterPage({@required this.filterPageController})
      : animation = FilterPageEnterAnimation(controller: filterPageController);

  final FilterPageEnterAnimation animation;

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  FilterPageEnterAnimation animation;
  @override
  void initState() {
    animation = widget.animation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 5.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedBuilder(
            animation: animation.controller,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.rotationX(animation.buildTitleZrotation(0.40, 0.75, Curves.decelerate,).value),
                child: FadeTransition(
                  opacity: animation.buildTitleOpacity(0.40, 0.75, Curves.easeIn,),
                  child: Text(
                    'Show only those;',
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, top: 15.0, bottom: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProfileOption(optionText: 'With mutual friends',),
                ProfileOption(optionText: 'With facebook account',),
                ProfileOption(optionText: 'With instagram account',),
                ProfileOption(optionText: 'With diary page',),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: AgeRangeSection(animation: animation,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: DistanceSection(animation: animation),
          ),
        ],
      ),
    );
  }
}






