import 'package:flutter/material.dart';
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
            SliverGrid.count(
              crossAxisCount: 3,
              children: [
                ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/08/11/07/57/rocky-coast-4398331_960_720.jpg', isFavorite: false),
                ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/08/08/11/23/butterfly-4392735__340.jpg', isFavorite: true),
                ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2017/03/17/21/35/tiger-2152747__340.jpg', isFavorite: false),
                ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/07/06/14/33/sea-4320564__340.jpg', isFavorite: true),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
