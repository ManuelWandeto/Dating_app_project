import 'package:states_rebuilder/states_rebuilder.dart';

class DistanceSliderViewModel extends StatesRebuilder {
  double selectedDistance = 80.0;

  updateSlider(String sliderId, double value) {
    selectedDistance = value;
    rebuildStates([sliderId, 'DistanceValueLabel']);
  }
}