import 'package:flutter/material.dart';
import 'package:our_mars/data/api/nasa_api.dart';
import 'package:our_mars/data/db/Database.dart';
import 'package:our_mars/data/model/models.dart';
import 'package:our_mars/resources/colors.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/resources/style.dart';
import 'package:our_mars/screens/screen_favorites/widgets_favorites.dart';
import 'package:our_mars/screens/screen_main/widgets_main.dart';

class ScreenFavorites extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenFavoritesState();
}

class ScreenFavoritesState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(32.0),
        /* child: Text(AppStrings.screen_favorites_title, style: AppStyles.text_style_title,),*/
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(
                AppStrings.screen_favorites_title,
                style: AppStyles.text_style_title,
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false),
              ),
              pinned: true,
              backgroundColor: AppColors.colorBackground,
            ),
            FutureBuilder<List<PhotoModel>>(
                    future: DBProvider.db.getFavoritePhotos(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if ((snapshot.data as List<PhotoModel>).length > 0) {
                          return ImageListGrid(photos: snapshot.data,);
                        } else return SliverList(delegate: SliverChildListDelegate([Text("No photo in favorites", style: AppStyles.text_style_default,)]),);
                      } else if (snapshot.hasError) {
                        return SliverList(delegate: SliverChildListDelegate([Text("Error", style: AppStyles.text_style_default,)]),);
                      }
                      return SliverList(delegate: SliverChildListDelegate([Text("Loading...", style: AppStyles.text_style_default,)]),);
                    },
                  ),
          ],
        ),
      )),
    );
  }
}

