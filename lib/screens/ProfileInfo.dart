import 'package:flirtr/UserProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flirtr/AppWidgets/AlbumCountDisplayWidget.dart';
import 'package:flirtr/AppWidgets/iconBubbleWidget.dart';
import 'package:flirtr/AppWidgets/NextSectionIndicator.dart';
import 'package:flirtr/AppWidgets/InterestChip.dart';
import 'package:flirtr/AppWidgets/MutualFriendWidget.dart';
import 'package:flirtr/enums.dart';

class ProfileInfo extends StatefulWidget {
  ProfileInfo({this.currentProfile});

  final UserProfile currentProfile;
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  UserProfile currentProfile;

  @override
  void initState() {
    currentProfile = widget.currentProfile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0A0D09).withOpacity(.9),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30.0, right: 10.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 10,
                        child: AlbumCountDisplayWidget(
                          currentProfile: currentProfile,
                          galleryType: GalleryType.PhotoUploads,
                          widgetSize: Size(130, 130),
                          galleryIcon: FontAwesomeIcons.camera,
                          galleryPhotoCount: 28,
                          galleryPreviewImage:
                              currentProfile.userPhotoUploads.first,
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Expanded(
                        flex: 10,
                        child: AlbumCountDisplayWidget(
                          currentProfile: currentProfile,
                          galleryType: GalleryType.InstagramUploads,
                          widgetSize: Size(130, 130),
                          galleryIcon: FontAwesomeIcons.instagram,
                          galleryPhotoCount: 145,
                          galleryPreviewImage:
                              AssetImage('images/darkthrone.jpg'),
                        ),
                      ),
                      Spacer(
                        flex: 5,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _buildSectionTitle(title: '${currentProfile.userName}, ${currentProfile.userAge}', icon: FontAwesomeIcons.user,),
                      Spacer(),
                      NextSectionIndicator(beginSize: 24, endSize: 28,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildSectionTitle(title: 'Basic Info', icon: FontAwesomeIcons.info,),
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
                                FontAwesomeIcons.home, currentProfile.userLocation),
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
                      _buildSectionTitle(
                          title: 'Mutual Interests',
                          icon: FontAwesomeIcons.smileBeam,
                          yAlign: -.15,),
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
                    _buildSectionTitle(title: 'Mutual Friends', icon: FontAwesomeIcons.userFriends, xAlign: -.20),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 40.0,
                        top: 15.0,
                      ),
                      child: Container(
                        height: 130.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: <Widget>[
                            MutualFriendWidget(
                              friendImage:
                                  AssetImage('images/brendaWairimu.jpg'),
                              friendName: 'Brenda Wairimu',
                            ),
                            MutualFriendWidget(
                              friendImage: AssetImage('images/brandyMaina.jpg'),
                              friendName: 'Brandy maina',
                            ),
                            MutualFriendWidget(
                              friendImage: AssetImage('images/wavinye.jpg'),
                              friendName: 'wavinye',
                            ),
                            MutualFriendWidget(
                              friendImage: AssetImage('images/manuel.jpg'),
                              friendName: 'Manuel',
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

  Row _buildSectionTitle(
      {String title,
      IconData icon,
      double yAlign = -.25,
      double xAlign = 0.0,}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconBubbleWidget(
          icon: icon,
          yAlign: yAlign,
          xAlign: xAlign,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline,
        ),
      ],
    );
  }
}




