
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    if (isBottomSheetOpened) {
      bottomSheetMenuController.close();
    } else {
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
    }
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
                SliverGrid.count(
                  crossAxisCount: 3,
                  children: [
                    ImageListItem(imageUrl: 'https://mk0astronomynow9oh6g.kinstacdn.com/wp-content/uploads/2017/09/pia21850-1785MR009211_sitesphericalmosaic_noscale-full.jpg', isFavorite: false),
                    ImageListItem(imageUrl: 'https://boygeniusreport.files.wordpress.com/2017/05/mars1.jpg?quality=98&strip=all&w=782', isFavorite: true),
                    ImageListItem(imageUrl: 'https://thenypost.files.wordpress.com/2019/03/mars-pebbles.jpg?quality=90&strip=all&w=618&h=410&crop=1', isFavorite: false),
                    ImageListItem(imageUrl: 'https://www.geek.com/wp-content/uploads/2019/04/curiosity-1-625x352.jpg', isFavorite: true),
                    ImageListItem(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIYGyyRdAGJ5N5WISIeinevCUezLB9MwJCE01hmh5ZJBls9ZM', isFavorite: false),
                    ImageListItem(imageUrl: 'https://mk0astronomynow9oh6g.kinstacdn.com/wp-content/uploads/2017/09/pia21850-1785MR009211_sitesphericalmosaic_noscale-full.jpg', isFavorite: false),
                    ImageListItem(imageUrl: 'https://boygeniusreport.files.wordpress.com/2017/05/mars1.jpg?quality=98&strip=all&w=782', isFavorite: true),
                    ImageListItem(imageUrl: 'https://thenypost.files.wordpress.com/2019/03/mars-pebbles.jpg?quality=90&strip=all&w=618&h=410&crop=1', isFavorite: false),
                    ImageListItem(imageUrl: 'https://www.geek.com/wp-content/uploads/2019/04/curiosity-1-625x352.jpg', isFavorite: true),
                    ImageListItem(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIYGyyRdAGJ5N5WISIeinevCUezLB9MwJCE01hmh5ZJBls9ZM', isFavorite: false),
                    ImageListItem(imageUrl: 'https://mk0astronomynow9oh6g.kinstacdn.com/wp-content/uploads/2017/09/pia21850-1785MR009211_sitesphericalmosaic_noscale-full.jpg', isFavorite: false),
                    ImageListItem(imageUrl: 'https://boygeniusreport.files.wordpress.com/2017/05/mars1.jpg?quality=98&strip=all&w=782', isFavorite: true),
                    ImageListItem(imageUrl: 'https://thenypost.files.wordpress.com/2019/03/mars-pebbles.jpg?quality=90&strip=all&w=618&h=410&crop=1', isFavorite: false),
                    ImageListItem(imageUrl: 'https://www.geek.com/wp-content/uploads/2019/04/curiosity-1-625x352.jpg', isFavorite: true),
                    ImageListItem(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIYGyyRdAGJ5N5WISIeinevCUezLB9MwJCE01hmh5ZJBls9ZM', isFavorite: false),
                  ],
                ),
              ],
            ),
            // buildBottomSheet()
          ],
        )
      ),
    );
  }
}



