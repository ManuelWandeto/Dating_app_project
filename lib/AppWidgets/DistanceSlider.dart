import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flirtr/ViewModels/DistanceSliderViewModel.dart';

class DistanceSlider extends StatelessWidget {

  DistanceSlider({this.distanceModel});

  final DistanceSliderViewModel distanceModel;

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      viewModels: [distanceModel],
      builder: (context, tagId) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            Slider(
              value: distanceModel.selectedDistance,
              min: 0,
              max: 180,
              onChanged: (value) {
                distanceModel.updateSlider(tagId, value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('0', style: Theme.of(context).textTheme.title.copyWith(letterSpacing: 18.0 * 0.02),),
                  Text('180km', style: Theme.of(context).textTheme.title.copyWith(letterSpacing: 18.0 * 0.02),),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}