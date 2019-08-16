import 'package:flutter/material.dart';
import 'package:our_mars/data/model/models.dart';
import 'package:our_mars/resources/colors.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/resources/style.dart';

class ScreenPhoto extends StatefulWidget {
  final PhotoModel photoModel;

  const ScreenPhoto({Key key, @required this.photoModel}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ScreenPhotoState(photoModel);
}

class ScreenPhotoState extends State {
  final PhotoModel photoModel;

  ScreenPhotoState(this.photoModel);
  
  @override
  Widget build(BuildContext context) {
    print(photoModel.id.toString());
    print(photoModel.roverType.toString());
    return Scaffold(
        backgroundColor: AppColors.colorBackground,
        body: SafeArea(
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 32.0, top: 16.0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {Navigator.pop(context);},
                    child: Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                  SizedBox(width: 16.0,),
                  Text(photoModel.roverType,
                      style: AppStyles.text_style_title)
                ],
              )),
          Container(
              height: 400.0,
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        photoModel.imageUrl)),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.redAccent,
              )),
          Padding(
              padding: EdgeInsets.only(left: 32.0, top: 16.0),
              child: Row(
                children: <Widget>[
                  Text(photoModel.camera,
                      style: AppStyles.text_style_default),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(left: 32.0, top: 16.0),
              child: Row(
                children: <Widget>[
                  Text('sol: ' + photoModel.sol.toString(),
                      style: AppStyles.text_style_default),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(left: 32.0, top: 16.0),
              child: Row(
                children: <Widget>[
                  Text(photoModel.earthDate,
                      style: AppStyles.text_style_default),
                ],
              ))
        ])));
  }
}
