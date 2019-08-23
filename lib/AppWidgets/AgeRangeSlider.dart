import 'package:flutter/material.dart';
import 'package:flirtr/ViewModels/SliderViewModel.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AgeRangeSlider extends StatefulWidget {
  final Function onChanged;
  AgeRangeSlider({this.onChanged});

  @override
  _AgeRangeSliderState createState() => _AgeRangeSliderState();
}

class _AgeRangeSliderState extends State<AgeRangeSlider> {
  SliderViewModel model;

  @override
  void initState() {
    model = SliderViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      viewModels: [model],
      builder: (context, tagId) {
        return RangeSlider(
          onChanged: (rangeValues) {
            model.updateSlider(tagId, rangeValues.start, rangeValues.end);
          },
          max: 60.0,
          min: 18.0,
          values: RangeValues(model.startValue, model.endValue),
        );
      },
    );
  }
}
