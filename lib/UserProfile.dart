import 'package:flutter/material.dart';

class UserProfile {
  String userName;
  int userAge;
  String userLocation;
  List<ImageProvider> userPhotoUploads = [];
  UserProfile({this.userName, this.userAge, this.userLocation, this.userPhotoUploads});

}