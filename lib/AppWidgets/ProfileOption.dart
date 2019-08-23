import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:flirtr/AppWidgets/customCheckBox.dart';
import 'package:flirtr/ViewModels/checkboxModel.dart';


class ProfileOption extends StatefulWidget {

  ProfileOption({@required this.optionText, this.onTap});

  final String optionText;
  final Function onTap;

  @override
  _ProfileOptionState createState() => _ProfileOptionState();
}

class _ProfileOptionState extends State<ProfileOption> {
  CheckBoxModel model;
  @override
  void initState() {
    model = CheckBoxModel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: StateBuilder(
        viewModels: [model],
        builder: (context, tagId) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomCheckBox(
                onPressed: () {
                  model.validate(tagId);
                  if(widget.onTap != null) {
                    widget.onTap();
                  }
                },
                animation: model.animation,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                widget.optionText,
                style: Theme.of(context).textTheme.title.copyWith(
                  color: Color(0xffF8F4E3).withOpacity(model.textOpacity),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
