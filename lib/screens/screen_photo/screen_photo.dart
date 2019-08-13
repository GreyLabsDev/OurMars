import 'package:flutter/material.dart';
import 'package:our_mars/resources/colors.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/resources/style.dart';

class ScreenPhoto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenPhotoState();
}

class ScreenPhotoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text(AppStrings.screen_photo_title, style: AppStyles.text_style_title,),
        )
      ),
    );
  }
}