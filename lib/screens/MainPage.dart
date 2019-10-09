import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:flirtr/screens/Profile.dart';

class MainPage extends StatefulWidget {

  static const String id = 'MainPage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {

  KFDrawerController drawerController;
  AnimationController menuController;
  bool _menuIsOpen = false;
  StreamController<bool> menuStateChanged = StreamController();

  @override
  void dispose() {
    menuStateChanged.close();
    super.dispose();
  }

  @override
  void initState() {
    TextStyle style = TextStyle(
      fontFamily: 'Dosis',
      fontWeight: FontWeight.w300,
      fontSize: 18.0,
      letterSpacing: 18.0 * .05,
      color: Color(0xffF8F4E3),
    );
    menuController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );


    drawerController = KFDrawerController(
      initialPage: Profile(
        menuStateChange: menuStateChanged.stream,
        onMenuIconTap: animateButton,
        menuController: menuController,
      ),
      items: <KFDrawerItem> [
        KFDrawerItem.initWithPage(
          icon: Icon(
            Icons.explore,
            size: 30.0,
            color: Color(0xffF8F4E3),
          ),
          text: Text(
            'Explore',
            style: style,
          ),
          page: Profile(menuStateChange: menuStateChanged.stream,),
          onPressed: () {
            animateButton();
          },
        ),
        KFDrawerItem.initWithPage(
          icon: Icon(
            Icons.chat_bubble,
            size: 30.0,
            color: Color(0xffF8F4E3),
          ),
          text: Text(
            'Chat',
            style: style,
          ),

        ),
        KFDrawerItem.initWithPage(
          icon: Icon(
            FontAwesomeIcons.user,
            size: 30.0,
            color: Color(0xffF8F4E3),
          ),
          text: Text(
            'Profile',
            style: style,
          ),

        ),
        KFDrawerItem.initWithPage(
          icon: Icon(
            FontAwesomeIcons.bell,
            size: 30.0,
            color: Color(0xffF8F4E3),
          ),
          text: Text(
            'Notification',
            style: style,
          ),

        ),
        KFDrawerItem.initWithPage(
          icon: Icon(
            FontAwesomeIcons.cog,
            size: 30.0,
            color: Color(0xffF8F4E3),
          ),
          text: Text(
            'Settings',
            style: style,
          ),
        ),
      ],
    );

    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: KFDrawer(
        drawerWidth: .55, //from 0 to 1 of the screen width
        header: Text('hello its me header'),
        footer: Text('Log Out'),
        decoration: BoxDecoration(
          color: Color(0xff343442),
        ),
        controller: drawerController,
        animationDuration: Duration(milliseconds: 950),
        disableContentTap: false,

      ),
    );
  }


  void animateButton() {
    if(_menuIsOpen != true) {
      menuController.forward(from: 0.0);
      drawerController.open();
    } else {
      menuController.reverse(from: 1.0);
      drawerController.close();
    }
    _menuIsOpen = !_menuIsOpen;

    menuStateChanged.sink.add(_menuIsOpen);
  }
}
