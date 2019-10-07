import 'package:flutter/material.dart';
import 'package:flirtr/UserProfile.dart';
import 'package:flirtr/AppWidgets/iconBubbleWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flirtr/AppWidgets/NextSectionIndicator.dart';

class DiaryPage extends StatelessWidget {
  final UserProfile currentProfile;
  final PageController pageController;

  DiaryPage({this.currentProfile, this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff080E11).withOpacity(.9),
      child: SafeArea(
          child: Scrollbar(
            child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 10.0),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconBubbleWidget(
                        icon: FontAwesomeIcons.user,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        currentProfile.userName,
                        style: Theme.of(context).textTheme.headline,
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () => pageController.animateToPage(
                                1,
                                duration: Duration(seconds: 2),
                                curve: Curves.easeOutQuint,
                              ),
                          child: NextSectionIndicator(
                            shouldRotate: true,
                            beginSize: 24.0,
                            endSize: 28.0,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Divider(
                    color: Color(0xffB5CBB7).withOpacity(.90),
                    indent: 40.0,
                    endIndent: 180.0,
                    thickness: 2.0,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0, right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildDiarySections(currentProfile, context),
                ),
              ),
            ],
        ),
      ),
          )),
    );
  }

  List<Widget> _buildDiarySections(
      UserProfile currentProfile, BuildContext context) {
    List<Widget> sections = <Widget>[];

    currentProfile.userDiary.forEach((key, value) {
      sections.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                key,
                style: Theme.of(context).textTheme.headline,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.title,
              ),
            ],
          ),
        ),
      );
    });

    return sections;
  }
}

//padding: EdgeInsets.only(left: 40.0, right: 10.0),
