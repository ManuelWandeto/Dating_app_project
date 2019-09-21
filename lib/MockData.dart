import 'package:flirtr/UserProfile.dart';
import 'package:flutter/material.dart';

class MockData {
  static final List<UserProfile> profiles = [
    UserProfile(
      userName: 'Jolie Throne',
      userAge: 21,
      userLocation: 'Nairobi, Kenya',
      userPhotoUploads: [
        AssetImage('images/beautiful_black_child.jpg'),
        AssetImage('images/darkthrone.jpg'),
        AssetImage('images/joliethronin.jpg'),
      ],
    ),
  ];
}
