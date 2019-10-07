import 'package:flirtr/UserMedia.dart';

class UserProfile {
  String userName;
  int userAge;
  String userLocation;
  List<UserMedia> userUploads = [];
  List<UserMedia> userInstagramMedia = [];
  Map<String, dynamic> basicInfo = {
    'Work' : null,
    'School' : null,
  };
  Map<String, dynamic> userDiary = {
    "Bio" : null,
  };
  UserProfile({this.userName, this.userAge, this.userLocation, this.userUploads, this.userInstagramMedia});


}