import 'package:flutter/material.dart';

class MutualFriendWidget extends StatelessWidget {
  MutualFriendWidget({@required this.friendImage, @required this.friendName});

  final AssetImage friendImage;
  final String friendName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        height: 130.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              child: Image(
                image: friendImage,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              friendName,
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}