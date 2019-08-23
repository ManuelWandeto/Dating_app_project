import 'package:flutter/material.dart';
import 'package:flirtr/FilterPageEnterAnimation.dart';
import 'package:flirtr/AppWidgets/ProfileOption.dart';
import 'package:flirtr/AppWidgets/AgeRangeSection.dart';
import 'package:flirtr/ViewModels/DistanceSliderViewModel.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class FilterPage extends StatefulWidget {
  final AnimationController filterPageController;

  FilterPage({@required this.filterPageController})
      : animation = FilterPageEnterAnimation(controller: filterPageController);

  final FilterPageEnterAnimation animation;

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  DistanceSliderViewModel distanceModel;
  FilterPageEnterAnimation animation;
  @override
  void initState() {
    distanceModel = DistanceSliderViewModel();
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
                transform: Matrix4.rotationX(animation.titleZrotation.value),
                child: FadeTransition(
                  opacity: animation.titleOpacity,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: animation.controller,
                    builder: (context, child) {
                      return Transform(
                        transform: Matrix4.rotationX(animation.titleZrotation.value),
                        child: FadeTransition(
                          opacity: animation.titleOpacity,
                          child: Text(
                            'Maximum Distance',
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    '62km',
                    style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0, letterSpacing: 16.0 * 0.02),
                  )
                ],
              ),
              StateBuilder(
                viewModels: [distanceModel],
                builder: (context, tagId) {
                  return Slider(
                    value: distanceModel.selectedDistance,
                    min: 0,
                    max: 180,
                    onChanged: (value) {
                      distanceModel.updateSlider(tagId, value);
                    },
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}




