import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoWidget extends StatelessWidget {
  final String url;
  PhotoWidget({@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                PhotoView(
                  imageProvider: AssetImage(url),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: Color(0xffF8F4E3),
                        size: 28.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .90,
        margin: EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          image:
          DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
        ),
      ),
    );
  }
}