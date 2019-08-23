import 'package:flutter/material.dart';
import 'screens/Profile.dart';
import 'package:flirtr/RangeSliderShape.dart';

void main() => runApp(FlirtrApp());

class FlirtrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Profile.id,
      routes: <String, WidgetBuilder>{
        Profile.id: (context) => Profile(),
      },
      title: 'Flirtr',
      theme: ThemeData(
        primaryColorBrightness: Brightness.dark,
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            color: Colors.transparent,
            iconTheme: IconThemeData(
              color: Color(0xffEDF4ED),
              opacity: 1.0,
              size: 30,
            )),
        textTheme: TextTheme(
          display2: TextStyle(
            fontFamily: 'Dosis',
            fontWeight: FontWeight.w100,
            fontSize: 70.0,
            color: Color(0xffF8F4E3),
          ),
          display1: TextStyle(
            fontFamily: 'Dosis',
            fontWeight: FontWeight.w300,
            fontSize: 41.0,
            color: Color(0xffF8F4E3),
          ),
          caption: TextStyle(
            fontFamily: 'Dosis',
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
            letterSpacing: 1.2,
            color: Color(0xffF8F4E3),
          ),
          headline: TextStyle(
            fontFamily: 'Lato',
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xffF8F4E3),
            letterSpacing: 22 * 0.02,
          ),
          title: TextStyle(
            fontFamily: 'Dosis',
            fontWeight: FontWeight.w300,
            fontSize: 18.0,
            letterSpacing: 18.0 * .05,
            color: Color(0xffF8F4E3),
          ),
        ),
        sliderTheme: SliderThemeData(
          trackHeight: 5.0,
          inactiveTrackColor: Color(0xffB5CBB7),
          activeTrackColor: Color(0xffE5AEAA),
          thumbColor: Color(0xffD19690),
          rangeThumbShape: StrokedRangeSliderThumbShape(
            enabledThumbRadius: 8.5,
            fillColor: Color(0xffD19690),
            strokeColor: Color(0xffF8F4E3),
            strokeWidth: 5.0,
          ),
          overlayColor: Color(0xffF8F4E3).withOpacity(0.3),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0),
        ),
      ),
    );
  }
}
