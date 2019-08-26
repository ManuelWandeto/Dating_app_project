import 'package:flutter/material.dart';
import 'package:flirtr/ViewModels/SliderViewModel.dart';
import 'package:flirtr/AppWidgets/AgeRangeSlider.dart';
import 'package:flirtr/FilterPageEnterAnimation.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: animation.controller,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.rotationX(animation
                      .buildTitleZrotation(
                        0.40,
                        0.75,
                        Curves.decelerate,
                      )
                      .value),
                  child: FadeTransition(
                    opacity: animation.buildTitleOpacity(
                      0.40,
                      0.75,
                      Curves.easeIn,
                    ),
                    child: Text(
                      'Age Range',
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                );
              },
            ),
            StateBuilder(
              tag: 'AgeRangeValueLabel',
              viewModels: [model],
              builder: (context, tagId) {
                return Transform(
                  transform: Matrix4.rotationX(animation
                      .buildTitleZrotation(
                        0.40,
                        0.75,
                        Curves.decelerate,
                      )
                      .value),
                  child: FadeTransition(
                    opacity: animation.buildTitleOpacity(
                      0.40,
                      0.75,
                      Curves.easeIn,
                    ),
                    child: Text(
                      '${model.startValue.toInt()} - ${model.endValue.toInt()}',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontSize: 16.0, letterSpacing: 16.0 * 0.02),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 5.0, left: 23.0),
          child: AnimatedBuilder(
            animation: animation.controller,
            builder: (context, widget) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.diagonal3Values(
                  animation.buildSliderScaleAnimation(0.60, 0.90).value,
                  animation.buildSliderScaleAnimation(0.60, 0.90).value,
                  1.0,
                ),
                child: AgeRangeSlider(model: model),
              );
            },
          ),
        ),
      ],
    );
  }
}
