import 'package:flirtr/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:flirtr/AppWidgets/iconBubbleWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flirtr/enums.dart';

class GalleryPage extends StatefulWidget {
  final GalleryType galleryType;
  final UserProfile currentProfile;

  GalleryPage({this.galleryType, this.currentProfile});
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<ImageProvider> images;

  @override
  void initState() {
    images = (widget.galleryType == GalleryType.PhotoUploads)
        ? widget.currentProfile.userPhotoUploads
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
                      child: Icon(
                        Icons.close,
                        color: Color(0xffF8F4E3),
                        size: 28.0,
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
                    return Container(
                      width: MediaQuery.of(context).size.width * .90,
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          image: DecorationImage(
                            image: image,
                            fit: BoxFit.cover
                          ),),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
