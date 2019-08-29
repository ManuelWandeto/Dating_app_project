import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flutter/material.dart';

class FilterIconModel extends StatesRebuilder {
  FilterIconModel({
    @required this.filterPageController,
  });
  bool showFilterPage = false;
  String filterAnimation;
  AnimationController filterPageController;

  animate(String iconTag) async {
    if (filterAnimation == null) {
      filterAnimation = 'FilterToClose';
      showFilterPage = true;
      filterPageController.forward(from: 0.0);
    } else {
      filterAnimation = 'CloseToFilters';
      filterPageController.reverse(from: 1.0);
      rebuildStates([iconTag]);
      await Future.delayed(filterPageController.duration, () {
        showFilterPage = false;
        filterAnimation = null;
      });
    }

    rebuildStates([iconTag, 'FilterPage']);
  }
}
