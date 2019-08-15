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
/*      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text(AppStrings.screen_photo_title, style: AppStyles.text_style_title,),
        )
      ),*/
        body: SafeArea(
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 32.0, top: 16.0),
              child: Row(
                children: <Widget>[
                  Text(AppStrings.screen_photo_title,
                      style: AppStyles.text_style_title)
                ],
              )),
          Container(
              height: 350.0,
              width: 350.0,
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIYGyyRdAGJ5N5WISIeinevCUezLB9MwJCE01hmh5ZJBls9ZM')),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.redAccent,
              )),
          Padding(
              padding: EdgeInsets.only(left: 32.0, top: 16.0),
              child: Row(
                children: <Widget>[
                  Text('Front Hazard Avoidance Camera',
                      style: AppStyles.text_style_default),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(left: 32.0, top: 16.0),
              child: Row(
                children: <Widget>[
                  Text('sol: 1004',
                      style: AppStyles.text_style_default),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(left: 32.0, top: 16.0),
              child: Row(
                children: <Widget>[
                  Text('2015-06-03',
                      style: AppStyles.text_style_default),
                ],
              ))
        ])));
  }
}
