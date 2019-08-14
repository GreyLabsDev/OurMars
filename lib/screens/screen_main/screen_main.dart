
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_mars/resources/colors.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/resources/style.dart';
import 'package:our_mars/screens/screen_favorites/widgets_favorites.dart';

import 'widgets_main.dart';

class ScreenMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenMainState();
}

class ScreenMainState extends State with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.colorBackground,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.only(left: 32.0, top: 16.0),
                      child: Row(
                        children: <Widget>[
                          Text(AppStrings.screen_main_title, style: AppStyles.text_style_title,),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState.showBottomSheet(
                                (BuildContext context) {
                                  return Container(
                                    height: 180.0,
                                    width: double.infinity,
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                       /* borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: )*/
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Text("Favorites", style: AppStyles.text_style_default,),
                                          Text("About", style: AppStyles.text_style_default,)
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              );
                            },
                            icon: Icon(Icons.menu, color: Colors.white,),
                          )
                        ],
                      )
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
                    ),
                    SizedBox(height: 16.0,),
                    Container(height: 36.0, child: StatefulMonthChipsGroup(),), 
                    SizedBox(height: 16.0,),
                  ]),
                ),
                ImageListGrid(),
              ],
            ),
            // buildBottomSheet()
          ],
        )
      ),
    );
  }
}




