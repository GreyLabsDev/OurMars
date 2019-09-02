import 'package:flutter/material.dart';
import 'package:our_mars/resources/colors.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/resources/style.dart';
import 'package:our_mars/screens/screen_about/widgets_about.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenAbout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenAboutState();
}

class ScreenAboutState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {Navigator.pop(context);},
                      child: Icon(Icons.arrow_back, color: Colors.white,),
                    ),
                    SizedBox(width: 16.0,),
                    Text(AppStrings.screen_about_title, style: AppStyles.text_style_title,),
                  ],
                ),
                SizedBox(height: 32.0,),
                Text(AppStrings.screen_about_text, style: AppStyles.text_style_default_text, textAlign: TextAlign.justify,),
                SizedBox(height: 16.0,),
                StatelessTextButton(
                  text: "GitHub",
                  onTap: () {
                    launch('https://github.com/GreyLabsDev/OurMars');
                  },
                ),
                SizedBox(height: 16.0,),
                Text(AppStrings.screen_about_contributors, style: AppStyles.text_style_default_text, textAlign: TextAlign.justify,),
                SizedBox(height: 16.0,),
                Row(
                  children: <Widget>[
                    StatelessTextButton(
                      text: "Sergey.Sh",
                      onTap: () {
                          launch('https://github.com/GreyLabsDev');
                      },
                    ),
                    SizedBox(width: 8.0,),
                    StatelessTextButton(
                      text: "Aleksey.K",
                      onTap: () {
                        launch('https://github.com/AlekseyKonovalov');
                      },
                    ),
                  ],
                )
              ],
            ),
          ) 
        )
      ),
    );
  }
}

