import 'package:flirtr/UserMedia.dart';
import 'package:flirtr/UserProfile.dart';
import 'package:flirtr/enums.dart';

class MockData {
  static final List<UserProfile> profiles = [
    UserProfile(
      userName: 'Jolie Throne',
      userAge: 21,
      userLocation: 'Nairobi, Kenya',
      userUploads: [
        UserMedia(url: 'images/jolieThrone/beautiful_black_child.jpg', mediaType: MediaType.Photo),
        UserMedia(url: 'images/jolieThrone/darkthrone.jpg', mediaType: MediaType.Photo),
        UserMedia(url: 'images/jolieThrone/joliethronin.jpg' , mediaType: MediaType.Photo),
        UserMedia(url: 'videos/vintageThrone.mp4', mediaType: MediaType.Video),
        UserMedia(url: 'images/jolieThrone/sexyThrone.jpg', mediaType: MediaType.Photo),
        UserMedia(url: 'videos/makeUp.mp4', mediaType: MediaType.Video),
      ],
    )
      ..basicInfo["Work"] = "Independent Lawyer"
      ..basicInfo["School"] = "Cambridge international"
      ..userDiary["Bio"] = "You cannot simply deduce how i think from a three line bio, for that, you need to look deeper into my eyes, swipe up, let us arrange that."
      ..userDiary["I am"] = "A young zealous lil motherfucker out to run the world, A normal millenial female outhere looking for love, In the grounds filled with hay may i find my needle"
      ..userDiary["My guilty Pleasures"] = "A young zealous lil motherfucker out to run the world, A normal millenial female outhere looking for love, In the grounds filled with hay may i find my needle"
      ..userDiary["I like"] = "A nice simple coffee date on a beautiful tuesday evening. ",

    UserProfile(
      userName: 'Nailah Kolii',
      userAge: 23,
      userLocation: 'Nairobi, Kenya',
      userUploads: [
        UserMedia(url: 'images/nailah_Kolii/nailah.jpg', mediaType: MediaType.Photo),
        UserMedia(url: 'images/nailah_Kolii/nailahCar.jpg', mediaType: MediaType.Photo),
        UserMedia(url: 'images/nailah_Kolii/nailahCleavage.jpg' , mediaType: MediaType.Photo),
        UserMedia(url: 'images/nailah_Kolii/nailahDarkCar.jpg', mediaType: MediaType.Photo),
        UserMedia(url: 'images/nailah_Kolii/nailahFlowerGirl.jpg', mediaType: MediaType.Photo),
        UserMedia(url: 'images/nailah_Kolii/nailahVideo.mp4', mediaType: MediaType.Video),
        UserMedia(url: 'images/nailah_Kolii/nailahmoody.jpg', mediaType: MediaType.Photo),
        UserMedia(url: 'images/nailah_Kolii/nailahMakeUp.jpg', mediaType: MediaType.Photo),
        UserMedia(url: 'images/nailah_Kolii/nailahBrownBg.jpg', mediaType: MediaType.Photo),
        UserMedia(url: 'images/nailah_Kolii/nailahLookingDown.jpg', mediaType: MediaType.Photo),
      ],
    )
      ..basicInfo["Work"] = "Freelance Make-Up Artist"
      ..basicInfo["School"] = "USIU"
      ..userDiary["Bio"] = "I'm in love with my damn self, but it does get lonely sometimes"
  ];
}
