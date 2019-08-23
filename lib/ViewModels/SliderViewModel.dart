import 'package:states_rebuilder/states_rebuilder.dart';

class SliderViewModel extends StatesRebuilder {
  double startValue = 20;
  double endValue = 28;

  updateSlider(String sliderId, start, end) {
    startValue = start;
    endValue = end;

    rebuildStates([sliderId, 'AgeRangeValueLabel']);
  }
}