import 'package:flirtr/AppWidgets/VideoWidget.dart';
import 'package:flirtr/UserMedia.dart';
import 'package:flirtr/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:flirtr/AppWidgets/iconBubbleWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flirtr/enums.dart';
import 'package:flirtr/AppWidgets/PhotoWidget.dart';

class GalleryPage extends StatefulWidget {
  final GalleryType galleryType;
  final UserProfile currentProfile;

  GalleryPage({this.galleryType, this.currentProfile});
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<UserMedia> images;

  @override
  void initState() {
    images = (widget.galleryType == GalleryType.PhotoUploads)
        ? widget.currentProfile.userUploads
        : widget.currentProfile.userInstagramMedia;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff242423).withOpacity(.95),
      child: Padding(
        padding: EdgeInsets.only(
          top: 25.0,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconBubbleWidget(
                      icon: Icons.view_carousel,
                      iconSize: 20.0,
                      widgetColor: Color(0xffF8F4E3),
                      yAlign: 0.1,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      widget.galleryType == GalleryType.PhotoUploads
                          ? 'Photos'
                          : 'Instagram',
                      style: Theme.of(context).textTheme.headline,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Hero(
                        tag: 'CloseButton',
                        child: Icon(
                          Icons.close,
                          color: Color(0xffF8F4E3),
                          size: 28.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.0),
                child: CarouselSlider(
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height * .80,
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: false,
                  items: images.map((image) {
                    return _buildMediaItem(image);
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMediaItem(UserMedia image) {
    if(image.mediaType == MediaType.Photo) {
      return PhotoWidget(url: image.url,);
    } else {
      return VideoWidget(url: image.url,);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}


