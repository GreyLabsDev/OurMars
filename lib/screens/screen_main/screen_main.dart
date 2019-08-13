
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_mars/resources/colors.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/resources/style.dart';

import 'widgets_main.dart';

class ScreenMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenMainState();
}

class ScreenMainState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 32.0, top: 16.0),
                child: Text(AppStrings.screen_main_title, style: AppStyles.text_style_title,),
              ),
              SizedBox(height: 32.0,),
              StatelessRoversPager(),
              SizedBox(height: 16.0,),
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: StatefulYearSelectorWidget(
                  yearString: "2019",
                  onTap: () {},
                ),
              )          
            ],
          ),
      ),
    );
  }
}




