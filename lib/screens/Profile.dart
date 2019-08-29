import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flirtr/AppWidgets/ProfileBackgroundEffect.dart';
import 'package:flirtr/MockData.dart';
import 'package:flirtr/UserProfile.dart';
import 'package:flirtr/AppWidgets/ProfileBody.dart';
import 'package:flirtr/ProfilePageAnimations.dart';
import 'package:flirtr/ViewModels/filterIconModel.dart';

class Profile extends StatefulWidget {
  static const String id = 'Profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  FilterIconModel filterModel;
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
        PageView(
          controller: controller,
          children: <Widget>[
            ProfileBody(
                opacityAnimation: profileAnimation.opacityAnimation,
                controller: controller,
                currentProfile: currentProfile,
                filtersPageController: filtersPageController,),
            Container(
              color: Color(0xff0A0D09).withOpacity(.9),
            ),
          ],
        ),
      ],
    );
  }
}


