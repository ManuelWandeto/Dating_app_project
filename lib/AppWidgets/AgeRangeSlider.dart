import 'package:flutter/material.dart';
import 'package:flirtr/ViewModels/SliderViewModel.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AgeRangeSlider extends StatelessWidget {

  AgeRangeSlider({this.model});

  final SliderViewModel model;

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      viewModels: [model],
      builder: (context, tagId) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RangeSlider(
              onChanged: (rangeValues) {
                model.updateSlider(tagId, rangeValues.start, rangeValues.end);
              },
              max: 60.0,
              min: 18.0,
              values: RangeValues(model.startValue, model.endValue),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('18', style: Theme.of(context).textTheme.title.copyWith(letterSpacing: 18.0 * 0.02),),
                  Text('60+', style: Theme.of(context).textTheme.title.copyWith(letterSpacing: 18.0 * 0.02),),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}