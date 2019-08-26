import 'package:flutter/material.dart';
import 'package:flirtr/ViewModels/SliderViewModel.dart';
import 'package:flirtr/AppWidgets/AgeRangeSlider.dart';
import 'package:flirtr/FilterPageEnterAnimation.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flirtr/AppWidgets/ZRotateWidget.dart';
import 'package:flirtr/AppWidgets/FractionalTranslateWidget.dart';

class AgeRangeSection extends StatefulWidget {
  final Function onChanged;
  final FilterPageEnterAnimation animation;
  AgeRangeSection({this.onChanged, this.animation});

  @override
  _AgeRangeSectionState createState() => _AgeRangeSectionState();
}

class _AgeRangeSectionState extends State<AgeRangeSection> {
  SliderViewModel model;
  FilterPageEnterAnimation animation;
  @override
  void initState() {
    model = SliderViewModel();
    animation = widget.animation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ZRotateWidget(
          animation: animation,
          beginAt: 0.40,
          endAt: 0.75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: animation.controller,
                builder: (context, child) {
                  return Text(
                    'Age Range',
                    style: Theme.of(context).textTheme.headline,
                  );
                },
              ),
              StateBuilder(
                tag: 'AgeRangeValueLabel',
                viewModels: [model],
                builder: (context, tagId) {
                  return Text(
                    '${model.startValue.toInt()} - ${model.endValue.toInt()}',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 16.0, letterSpacing: 16.0 * 0.02),
                  );
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 5.0, left: 23.0),
          child: FractionalTranslateWidget(
            animation: animation,
            beginAt: 0.65,
            endAt: 0.85,
            child: AgeRangeSlider(model: model),
          ),
        ),
      ],
    );
  }
}
