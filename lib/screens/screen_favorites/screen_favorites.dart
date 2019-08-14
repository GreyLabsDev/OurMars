import 'package:flutter/material.dart';
import 'package:our_mars/data/api/nasa_api.dart';
import 'package:our_mars/data/model/models.dart';
import 'package:our_mars/resources/colors.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/resources/style.dart';
import 'package:our_mars/screens/screen_favorites/widgets_favorites.dart';

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
                    future: NasaApi().getPhotos(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ImageListGrid(photos: snapshot.data,);
                      } else if (snapshot.hasError) {
                        return SliverList(delegate: SliverChildListDelegate([Text("Error", style: AppStyles.text_style_default,)]),); Text("${snapshot.error}");
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

