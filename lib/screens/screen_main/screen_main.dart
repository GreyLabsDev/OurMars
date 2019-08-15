
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_mars/data/api/nasa_api.dart';
import 'package:our_mars/data/model/models.dart';
import 'package:our_mars/resources/colors.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/resources/style.dart';
import 'package:our_mars/screens/screen_about/screen_about.dart';
import 'package:our_mars/screens/screen_favorites/screen_favorites.dart';
import 'package:our_mars/screens/screen_favorites/widgets_favorites.dart';

import 'widgets_main.dart';

class ScreenMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenMainState();
}

class ScreenMainState extends State with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  var isBottomSheetOpened = false;
  PersistentBottomSheetController bottomSheetMenuController;

  void showBottomSheetMenu() {
    // if (isBottomSheetOpened) {
      // bottomSheetMenuController.close();
    // } else {
      bottomSheetMenuController = scaffoldKey.currentState.showBottomSheet(
       (builder) {
           return SemiRoundedBorderContainer(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              radius: const Radius.circular(32.0),
              background: const Color(0xFF000000),
              height: 160.0,
              child: StatelessBottomSheetMenuContent(
                onFavoritesClick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenFavorites()));
                },
                onAboutClick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenAbout()));
                },
              ),
            );
          },
          backgroundColor: Colors.transparent,
      );
    // }
    isBottomSheetOpened = !isBottomSheetOpened;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                            onPressed: showBottomSheetMenu,
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
                SliverPadding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  sliver: FutureBuilder<List<PhotoModel>>(
                    future: NasaApi().getPhotosTest(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if ((snapshot.data as List<PhotoModel>).length > 0) {
                          return ImageListGrid(photos: snapshot.data,);
                        } else return SliverList(delegate: SliverChildListDelegate([Text("No photo for this time", style: AppStyles.text_style_default,)]),);
                      } else if (snapshot.hasError) {
                        print(snapshot.error.toString());
                        return SliverList(delegate: SliverChildListDelegate([Text("Error", style: AppStyles.text_style_default,)]),); Text("${snapshot.error}");
                      }
                      return SliverList(delegate: SliverChildListDelegate([Text("Loading...", style: AppStyles.text_style_default,)]),);
                    },
                  ),
                )
              ],
            ),
            // buildBottomSheet()
          ],
        )
      ),
    );
  }
}



