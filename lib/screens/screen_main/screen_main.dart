
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

class ScreenMainState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ),
                    SizedBox(height: 16.0,),
                    Container(height: 36.0, child: StatefulMonthChipsGroup(),), 
                    SizedBox(height: 16.0,),
                  ]),
                ),
                SliverGrid.count(
                  crossAxisCount: 3,
                  children: [
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/08/11/07/57/rocky-coast-4398331_960_720.jpg', isFavorite: false),
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/08/08/11/23/butterfly-4392735__340.jpg', isFavorite: true),
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2017/03/17/21/35/tiger-2152747__340.jpg', isFavorite: false),
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/07/06/14/33/sea-4320564__340.jpg', isFavorite: true),
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/08/11/07/57/rocky-coast-4398331_960_720.jpg', isFavorite: false),
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/08/08/11/23/butterfly-4392735__340.jpg', isFavorite: true),
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2017/03/17/21/35/tiger-2152747__340.jpg', isFavorite: false),
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/07/06/14/33/sea-4320564__340.jpg', isFavorite: true),
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/08/11/07/57/rocky-coast-4398331_960_720.jpg', isFavorite: false),
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/08/08/11/23/butterfly-4392735__340.jpg', isFavorite: true),
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2017/03/17/21/35/tiger-2152747__340.jpg', isFavorite: false),
                    ImageListItem(imageUrl: 'https://cdn.pixabay.com/photo/2019/07/06/14/33/sea-4320564__340.jpg', isFavorite: true),
                  ],
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}




