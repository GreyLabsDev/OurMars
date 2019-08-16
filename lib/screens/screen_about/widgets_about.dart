import 'package:flutter/material.dart';
import 'package:our_mars/resources/style.dart';

class StatelessTextButton extends StatelessWidget {
  final String text;
  Function() onTap;

  StatelessTextButton({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: new Container(
        padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0, right: 16.0),
        decoration: new BoxDecoration(
            border: new Border.all(color: Colors.white, width: 1.0),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
          ),
        child: new Text(
          text, 
          style: AppStyles.text_style_default,),
      ),
    );
  }

}