import 'package:flutter/material.dart';
import 'package:flirtr/AppWidgets/BasicInfo.dart';
import 'package:flirtr/AppWidgets/FilterIcon.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flirtr/screens/FilterPage.dart';
import 'package:flirtr/ViewModels/filterIconModel.dart';
import 'package:flirtr/UserProfile.dart';
import 'package:flirtr/ViewModels/PageViewModel.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    @required this.onMenuTap,
    @required this.pageViewModel,
    @required this.disableParentViewScroll,
    @required this.opacityAnimation,
    @required this.controller,
    @required this.currentProfile,
    @required this.filtersPageController,
  });
  final Function onMenuTap;
  final PageViewModel pageViewModel;
  final Function disableParentViewScroll;
  final Animation<double> opacityAnimation;
  final PageController controller;
  final UserProfile currentProfile;
  final AnimationController filtersPageController;

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> with SingleTickerProviderStateMixin{

  bool menuIsOpen = false;
  FilterIconModel filterModel;
  AnimationController menuController;

  @override
  void initState() {
    filterModel = FilterIconModel(filterPageController: widget.filtersPageController);
    menuController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                child: GestureDetector(
                  onTap: () {
                    if(menuIsOpen != true) {
                      menuController.forward(from: 0.0);
                      menuIsOpen = true;
                      widget.onMenuTap();
                    } else {
                      menuController.reverse(from: 1.0);
                      menuIsOpen = false;
                      widget.onMenuTap();
                    }
                  },
                  child: AnimatedIcon(
                    color: Color(0xffEDF4ED),
                    icon: AnimatedIcons.menu_close,
                    size: 35.0,
                    progress: CurvedAnimation(parent: menuController, curve: Curves.decelerate, reverseCurve: Curves.easeIn),
                  ),
                ),
              ),
              StateBuilder(
                viewModels: [filterModel],
                builder: (context, tagId) {
                  return FilterIcon(
                    onPressed: () {
                      filterModel.animate(tagId);
                      widget.disableParentViewScroll();
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
                  if(widget.pageViewModel.physics == null) {
                    widget.controller.animateToPage(1,
                        duration: Duration(seconds: 2),
                        curve: Curves.easeOutQuint);
                  }
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

}