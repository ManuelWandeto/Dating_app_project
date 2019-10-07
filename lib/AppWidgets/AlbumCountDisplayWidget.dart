import 'package:flirtr/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:flirtr/screens/GalleryPage.dart';
import 'package:flirtr/enums.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlbumCountDisplayWidget extends StatelessWidget {
  AlbumCountDisplayWidget({
    @required this.galleryType,
    @required this.currentProfile,
  });

  final UserProfile currentProfile;
  final Size widgetSize = Size(130, 130);
  final GalleryType galleryType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => GalleryPage(
              galleryType: galleryType,
              currentProfile: currentProfile,
            ),
          ),
        );
      },
      child: Container(
        height: widgetSize.height,
        width: widgetSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          image: DecorationImage(
            image: galleryType == GalleryType.PhotoUploads ? AssetImage(currentProfile.userUploads.first.url) : AssetImage(currentProfile.userInstagramMedia.first.url),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            color: Color(0xff242423).withOpacity(.5),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    (galleryType == GalleryType.PhotoUploads) ? FontAwesomeIcons.camera : FontAwesomeIcons.instagram,
                    color: Color(0xffF8F4E3),
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    galleryType == GalleryType.PhotoUploads ? currentProfile.userUploads.length.toString() : currentProfile.userInstagramMedia.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
