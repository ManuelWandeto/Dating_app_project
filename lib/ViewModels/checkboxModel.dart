import 'package:states_rebuilder/states_rebuilder.dart';

class CheckBoxModel extends StatesRebuilder {
  bool isChecked;
  String animation;
  double textOpacity = .8;

  validate(String boxId) async {
    isChecked =
        (isChecked == null) ? true : (isChecked == false) ? true : false;
//    animation = (isChecked) ? 'To_Checked' : 'To_Unchecked';
    if(isChecked) {
      animation = 'To_Checked';
    } else {
      animation = 'To_Unchecked';
      rebuildStates([boxId]);
      await Future.delayed(Duration(milliseconds: 500), () => animation = null);
    }
    textOpacity = (isChecked)
        ? 1.0
        : .8;

    rebuildStates([boxId]);
  }
}
