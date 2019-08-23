import 'package:flutter/material.dart';
import 'package:flirtr/FilterPageEnterAnimation.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flirtr/ViewModels/DistanceSliderViewModel.dart';
import 'package:flirtr/AppWidgets/DistanceSlider.dart';

class DistanceSection extends StatefulWidget {
  DistanceSection({this.animation, this.onChanged});

  @override
  _DistanceSectionState createState() => _DistanceSectionState();

  final Function onChanged;
  final FilterPageEnterAnimation animation;
}

class _DistanceSectionState extends State<DistanceSection> {
  FilterPageEnterAnimation animation;
  DistanceSliderViewModel distanceModel;

  @override
  void initState() {
    animation = widget.animation;
    distanceModel = DistanceSliderViewModel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
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
            StateBuilder(
              tag: 'DistanceValueLabel',
              viewModels: [distanceModel],
              builder: (context, labelId) {
                return Text(
                  '${distanceModel.selectedDistance.toInt()} km',
                  style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0, letterSpacing: 16.0 * 0.02),
                );
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 5.0, left: 23.0),
          child: DistanceSlider(distanceModel: distanceModel),
        )
      ],
    );
  }
}


