import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flirtr/AppWidgets/ProfileBackgroundEffect.dart';
import 'package:flirtr/MockData.dart';
import 'package:flirtr/UserProfile.dart';
import 'package:flirtr/AppWidgets/ProfileBody.dart';
import 'package:flirtr/ProfilePageAnimations.dart';
import 'package:flirtr/ViewModels/filterIconModel.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flirtr/ViewModels/PageViewModel.dart';
import 'package:flirtr/screens/ProfileInfo.dart';

class Profile extends StatefulWidget {
  static const String id = 'Profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  FilterIconModel filterModel;
  PageViewModel pageViewModel;
  GlobalKey bodyKey = GlobalKey();
  PageController controller = PageController(
    initialPage: 0,
  );
  AnimationController filtersPageController;
  UserProfile currentProfile = MockData.profiles.first;
  ProfilePageAnimation profileAnimation;

  @override
  void initState() {
    filtersPageController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    profileAnimation = ProfilePageAnimation(filtersPageController: filtersPageController);
    filterModel = FilterIconModel(filterPageController: filtersPageController);
    pageViewModel = PageViewModel();
    super.initState();
  }

  @override
  void dispose() {
    filtersPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: currentProfile.userPhotoUploads.first,
              fit: BoxFit.cover,
            ),
          ),
        ),
        BackgroundEffectLayer(
          fadeController: filtersPageController,
        ),
        AnimatedBuilder(
          animation: profileAnimation.backdropAnimation,
          builder: (context, child) {
            return BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: profileAnimation.backdropAnimation.value,
                sigmaY: profileAnimation.backdropAnimation.value,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            );
          },
        ),
        StateBuilder(
          viewModels: [pageViewModel],
          builder: (context, tagId) {
            return PageView(
              controller: controller,
              physics: pageViewModel.physics,
              children: <Widget>[
                ProfileBody(
                  disableParentViewScroll: () {
                    pageViewModel.updatePageviewPhysics(tagId);
                  },
                  pageViewModel: pageViewModel,
                  opacityAnimation: profileAnimation.opacityAnimation,
                  controller: controller,
                  currentProfile: currentProfile,
                  filtersPageController: filtersPageController,),
                ProfileInfo(currentProfile: currentProfile,),

              ],
            );
          },
        ),
      ],
    );
  }
}


