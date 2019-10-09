import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flutter/material.dart';

class PageViewModel extends StatesRebuilder {
  ScrollPhysics physics;

  void updatePageviewPhysics () async {

    await Future.delayed(Duration(milliseconds: 50), () => physics = (physics == null) ? NeverScrollableScrollPhysics() : null);

    rebuildStates(['PageView']);
  }
}