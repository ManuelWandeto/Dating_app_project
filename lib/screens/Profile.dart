import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flirtr/AppWidgets/ProfileBackgroundEffect.dart';
import 'package:flirtr/MockData.dart';
import 'package:flirtr/UserProfile.dart';
import 'package:flirtr/AppWidgets/ProfileBody.dart';
import 'package:flirtr/ProfilePageAnimations.dart';
import 'package:flirtr/ViewModels/filterIconModel.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flirtr/ViewModels/PageViewModel.dart';
import 'package:flirtr/screens/ProfileInfo.dart';
import 'DiaryPage.dart';

// ignore: must_be_immutable
class Profile extends KFDrawerContent {
  static const String id = 'Profile';
  final Function onMenuIconTap;
  final AnimationController menuController;
  Stream<bool> menuStateChange;
  Profile({this.onMenuIconTap, this.menuController, @required this.menuStateChange});

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
    widget.menuStateChange.listen((data) {
      pageViewModel.updatePageviewPhysics();
    });
    filtersPageController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    profileAnimation =
        ProfilePageAnimation(filtersPageController: filtersPageController);
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
              image: AssetImage(currentProfile.userUploads.first.url),
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
          tag: 'PageView',
          builder: (context, tagId) {
            return PageView(
              controller: controller,
              physics: pageViewModel.physics,
              children: <Widget>[
                GestureDetector(
                  onVerticalDragEnd: (details) {
                    if (details.velocity.pixelsPerSecond.dy < 0 &&
                        pageViewModel.physics == null) {
                      setState(() {
                        currentProfile = MockData.profiles[1];
                        print(details.velocity.pixelsPerSecond.dy);
                      });
                    } else if (details.velocity.pixelsPerSecond.dy > 0) {
                      setState(() {
                        currentProfile = MockData.profiles[0];
                        print(details.velocity.pixelsPerSecond.dy);
                      });
                    }
                  },
                  child: ProfileBody(
                    disableParentViewScroll: () {
                      pageViewModel.updatePageviewPhysics();
                    },
                    onMenuTap: () {
                      widget.onMenuIconTap();
                    },
                    menuController: widget.menuController,
                    pageViewModel: pageViewModel,
                    opacityAnimation: profileAnimation.opacityAnimation,
                    controller: controller,
                    currentProfile: currentProfile,
                    filtersPageController: filtersPageController,
                  ),
                ),
                ProfileInfo(
                  currentProfile: currentProfile,
                  pageController: controller,
                ),
                DiaryPage(
                    currentProfile: currentProfile, pageController: controller),
              ],
            );
          },
        ),
      ],
    );
  }
}
