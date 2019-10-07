import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:flirtr/screens/Profile.dart';

class MainPage extends StatefulWidget {

  static const String id = 'MainPage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool menuOpen = false;
  KFDrawerController drawerController;
  @override
  void initState() {
    TextStyle style = TextStyle(
      fontFamily: 'Dosis',
      fontWeight: FontWeight.w300,
      fontSize: 18.0,
      letterSpacing: 18.0 * .05,
      color: Color(0xffF8F4E3),
    );

    drawerController = KFDrawerController(
      initialPage: Profile(
        onMenuIconTap: _handleMenu,
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
          page: Profile(),
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

  _handleMenu() {
    if(menuOpen != true) {
      drawerController.open();
      menuOpen = true;
    } else {
      drawerController.close();
      menuOpen = false;
    }
  }
}
