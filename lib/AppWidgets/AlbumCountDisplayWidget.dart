import 'package:flutter/material.dart';

class AlbumCountDisplayWidget extends StatelessWidget {
  AlbumCountDisplayWidget(
      {this.galleryPreviewImage, this.galleryIcon, this.galleryPhotoCount, @required this.widgetSize});

  final AssetImage galleryPreviewImage;
  final IconData galleryIcon;
  final int galleryPhotoCount;
  final Size widgetSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widgetSize.height,
      width: widgetSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        image: DecorationImage(
          image: galleryPreviewImage,
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
                  galleryIcon,
                  color: Color(0xffF8F4E3),
                  size: 24.0,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  galleryPhotoCount.toString(),
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
    );
  }
}
