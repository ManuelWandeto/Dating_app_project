import 'package:flutter/material.dart';
import 'package:flirtr/presentation/app_bar_icons_icons.dart';
import 'package:flirtr/AppWidgets/NextSectionIndicator.dart';

class BasicInfo extends StatelessWidget {
  final Function onIndicatorPressed;
  final String profileName;
  final int profileAge;
  final String profileLocation;
  BasicInfo(
      {this.profileName,
      this.profileAge,
      this.profileLocation,
      this.onIndicatorPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                profileAge.toString(),
                style: Theme.of(context).textTheme.display2,
              ),
              //TODO: make it so that user can tap anywhere around the icon
              GestureDetector(
                onTap: onIndicatorPressed,
                child: NextSectionIndicator(),
              ),
            ],
          ),
          SizedBox(
            height: 3.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                profileName,
                style: Theme.of(context).textTheme.display1,
              ),
              Icon(
                AppBarIcons.star,
                color: Color(0xffE5AEAA),
                size: 26.0,
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 15.0,
              ),
              SizedBox(
                width: 2.0,
              ),
              Text(
                profileLocation,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ],
      ),
    );
  }
}
