import 'package:flutter/material.dart';

class InterestChip extends StatelessWidget {
  InterestChip({@required this.interest});
  final String interest;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Color(0xffF8F4E3), width: 1.0, style: BorderStyle.solid,),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
          child: Center(
            child: Text(
              interest,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),
    );
  }
}