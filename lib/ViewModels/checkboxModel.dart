import 'package:states_rebuilder/states_rebuilder.dart';

class CheckBoxModel extends StatesRebuilder {
  bool isChecked;
  String animation;
  double textOpacity = .8;

  validate(String boxId) {
    isChecked =
        (isChecked == null) ? true : (isChecked == false) ? true : false;
    animation = (isChecked) ? 'To_Checked' : 'To_Unchecked';
    textOpacity = (isChecked)
        ? 1.0
        : .8;

    rebuildStates([boxId]);
  }
}
