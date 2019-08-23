import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flutter/material.dart';

class FilterIconModel extends StatesRebuilder {
  FilterIconModel({this.filterPageController});
  String filterAnimation;
  AnimationController filterPageController;

  animate(String iconTag) {

    if(filterAnimation == null) {
      filterAnimation = 'FilterToClose';
      filterPageController.forward(from: 0.0);
    } else if(filterAnimation == 'CloseToFilters') {
      filterAnimation = 'FilterToClose';
      filterPageController.forward(from: 0.0);
    } else {
      filterAnimation = 'CloseToFilters';
      filterPageController.reverse(from: 1.0);
    }

    rebuildStates([iconTag]);
  }
}
