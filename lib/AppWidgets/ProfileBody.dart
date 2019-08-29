import 'package:flutter/material.dart';
import 'package:flirtr/AppWidgets/BasicInfo.dart';
import 'package:flirtr/AppWidgets/FilterIcon.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flirtr/screens/FilterPage.dart';
import 'package:flirtr/ViewModels/filterIconModel.dart';
import 'package:flirtr/UserProfile.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    @required this.opacityAnimation,
    @required this.controller,
    @required this.currentProfile,
    @required this.filtersPageController,
  });

  final Animation<double> opacityAnimation;
  final PageController controller;
  final UserProfile currentProfile;
  final AnimationController filtersPageController;

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> with AutomaticKeepAliveClientMixin<ProfileBody> {
  FilterIconModel filterModel;
  @override
  void initState() {
    filterModel = FilterIconModel(filterPageController: widget.filtersPageController);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
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
                opacity: widget.opacityAnimation,
                child: Icon(
                  Icons.menu,
                ),
              ),
              StateBuilder(
                viewModels: [filterModel],
                builder: (context, tagId) {
                  return FilterIcon(
                    onPressed: () {
                      filterModel.animate(tagId);
                    },
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
            opacity: widget.opacityAnimation,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BasicInfo(
                onIndicatorPressed: () {
                  widget.controller.animateToPage(1,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeOutQuint);
                },
                profileName: widget.currentProfile.userName,
                profileAge: widget.currentProfile.userAge,
                profileLocation: widget.currentProfile.userLocation,
              ),
            ),
          ),
          StateBuilder(
            tag: 'FilterPage',
            viewModels: [filterModel],
            builder: (context, id) {
              return Visibility(
                visible: filterModel.showFilterPage,
                maintainState: true,
                child: FilterPage(
                  filterPageController: widget.filtersPageController,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}