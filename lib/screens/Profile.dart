import 'package:flutter/material.dart';
import 'package:flirtr/AppWidgets/BasicInfo.dart';
import 'package:flirtr/AppWidgets/FilterIcon.dart';
import 'dart:ui' as ui;
import 'FilterPage.dart';
import 'package:flirtr/AppWidgets/ProfileBackgroundEffect.dart';
import 'package:flirtr/MockData.dart';
import 'package:flirtr/UserProfile.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flirtr/ViewModels/filterIconModel.dart';

class Profile extends StatefulWidget {
  static const String id = 'Profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  AnimationController filtersPageController;
  FilterIconModel filterModel;
  UserProfile currentProfile = MockData.profiles.first;

  @override
  void initState() {
    filtersPageController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
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
    Animation<double> backdropAnimation =
        Tween<double>(begin: 0.0, end: 5.0).animate(
      CurvedAnimation(
          curve: Interval(0.0, 0.50, curve: Curves.decelerate),
          reverseCurve: Interval(0.0, 0.35, curve: Curves.decelerate),
          parent: filtersPageController),
    );
    Animation<double> opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
          curve: Interval(0.0, 0.25, curve: Curves.easeOut),
          parent: filtersPageController),
    );

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
          animation: backdropAnimation,
          builder: (context, child) {
            return BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: backdropAnimation.value,
                sigmaY: backdropAnimation.value,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            );
          },
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FadeTransition(
                    opacity: opacityAnimation,
                    child: Icon(
                      Icons.menu,
                    ),
                  ),
                  StateBuilder(
                    viewModels: [filterModel],
                    builder: (context, tagId) {
                      return FilterIcon(
                        onPressed: () => filterModel.animate(tagId),
                        filterAnimation: filterModel.filterAnimation,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FadeTransition(
                opacity: opacityAnimation,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BasicInfo(
                    profileName: currentProfile.userName,
                    profileAge: currentProfile.userAge,
                    profileLocation: currentProfile.userLocation,
                  ),
                ),
              ),
              FilterPage(
                filterPageController: filtersPageController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


