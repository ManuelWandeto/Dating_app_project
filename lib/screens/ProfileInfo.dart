import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flirtr/AppWidgets/AlbumCountDisplayWidget.dart';
import 'package:flirtr/AppWidgets/iconBubbleWidget.dart';
import 'package:flirtr/AppWidgets/NextSectionIndicator.dart';
import 'package:flirtr/AppWidgets/InterestChip.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0A0D09).withOpacity(.9),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30.0, top: 25.0, right: 10.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            reverse: true,
            scrollDirection: Axis.vertical,
            child: Column(
              //TODO: FIX OVERFLOWS BY IMPLEMENTING SCROLL
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: AlbumCountDisplayWidget(
                        widgetSize: Size(130, 130),
                        galleryIcon: FontAwesomeIcons.camera,
                        galleryPhotoCount: 28,
                        galleryPreviewImage:
                            AssetImage('images/joliethronin.jpg'),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      flex: 10,
                      child: AlbumCountDisplayWidget(
                        widgetSize: Size(130, 130),
                        galleryIcon: FontAwesomeIcons.instagram,
                        galleryPhotoCount: 145,
                        galleryPreviewImage: AssetImage('images/darkthrone.jpg'),
                      ),
                    ),
                    Spacer(
                      flex: 5,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconBubbleWidget(
                        icon: FontAwesomeIcons.user,
                        widgetSize: Size(30.0, 30.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Jolie Throne, 21',
                        style: Theme.of(context).textTheme.headline,
                      ),
                      Spacer(),
                      //TODO: FIX NEXT SECTION INDICATOR ANIMATION CAUSING A SHAKE IN SIZE
                      NextSectionIndicator(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        //TODO: DONT REPEAT THIS CODE
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconBubbleWidget(
                            icon: FontAwesomeIcons.info,
                            widgetSize: Size(30.0, 30.0),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Basic Info',
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 40.0,
                          top: 15.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildOccupationWidget(FontAwesomeIcons.briefcase,
                                'Independent Lawyer'),
                            SizedBox(
                              height: 10.0,
                            ),
                            _buildOccupationWidget(
                                FontAwesomeIcons.graduationCap,
                                'Cambridge international'),
                            SizedBox(
                              height: 10.0,
                            ),
                            _buildOccupationWidget(
                                FontAwesomeIcons.home, 'Nairobi, Kenya'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconBubbleWidget(
                            icon: FontAwesomeIcons.smileBeam,
                            widgetSize: Size(30.0, 30.0),
                            yAlign: -.15,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Mutual Interests',
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 40.0,
                          top: 15.0,
                        ),
                        child: Container(
                          height: 40.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            children: <Widget>[
                              InterestChip(
                                interest: 'Music',
                              ),
                              InterestChip(
                                interest: 'Hiking',
                              ),
                              InterestChip(
                                interest: 'Netflix',
                              ),
                              InterestChip(
                                interest: 'Photography',
                              ),
                              InterestChip(
                                interest: 'Modelling',
                              ),
                              InterestChip(
                                interest: 'Kayaking',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      //TODO: DONT REPEAT THIS CODE
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconBubbleWidget(
                          icon: FontAwesomeIcons.userFriends,
                          widgetSize: Size(30.0, 30.0),
                          xAlign: -.20,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Mutual Friends',
                          style: Theme.of(context).textTheme.headline,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 40.0,
                        top: 15.0,
                      ),
                      child: Container(
                        height: 130.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                              child: Image(
                                image: AssetImage('images/beautiful_black_child.jpg'),
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10.0),),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              'Sheila_nduta',
                              style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOccupationWidget(IconData icon, String occupation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 15.0,
          color: Color(0xffF8F4E3),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          occupation,
          style: Theme.of(context).textTheme.title,
        ),
      ],
    );
  }
}
