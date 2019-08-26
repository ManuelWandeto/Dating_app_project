import 'package:flutter/material.dart';
import 'package:flirtr/FilterPageEnterAnimation.dart';
import 'package:flirtr/AppWidgets/AgeRangeSection.dart';
import 'package:flirtr/AppWidgets/DistanceSection.dart';
import 'package:flirtr/ProfileOptionAnimation.dart';
import 'package:flirtr/AppWidgets/ZRotateWidget.dart';

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
              return ZRotateWidget(
                animation: animation,
                beginAt: 0.40,
                endAt: 0.70,
                child: Text(
                  'Show only those;',
                  style: Theme.of(context).textTheme.headline,
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
                ProfileOptionAnimation(optionText: 'With mutual friends', beginAt: 0.45, endAt: 0.65, animation: animation,),
                ProfileOptionAnimation(optionText: 'With facebook account', beginAt: 0.55, endAt: 0.75, animation: animation,),
                ProfileOptionAnimation(optionText: 'With instagram account', beginAt: 0.60, endAt: 0.85, animation: animation,),
                ProfileOptionAnimation(optionText: 'With diary page', beginAt: 0.65, endAt: 0.95, animation: animation,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: AgeRangeSection(
              animation: animation,
            ),
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
