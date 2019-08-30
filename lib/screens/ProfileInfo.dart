import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flirtr/AppWidgets/AlbumCountDisplayWidget.dart';

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
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
