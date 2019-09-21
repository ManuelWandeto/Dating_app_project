import 'package:flutter/material.dart';

class UserProfile {
  String userName;
  int userAge;
  String userLocation;
  List<ImageProvider> userPhotoUploads = [];
  List<ImageProvider> userInstagramMedia = [];
  UserProfile({this.userName, this.userAge, this.userLocation, this.userPhotoUploads, this.userInstagramMedia});


}