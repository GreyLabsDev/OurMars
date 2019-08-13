
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
  static const PANEL_HEADER_HEIGHT = 32.0;

  AnimationController animController;

  bool get isPanelVisible {
    final AnimationStatus status = animController.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

  @override
  void initState() {
    super.initState();
    animController = new AnimationController(duration: Duration(milliseconds: 250), value: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    animController.dispose();
  }

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final double height = constraints.biggest.height;
    final double top = height - PANEL_HEADER_HEIGHT;
    final double bottom = -PANEL_HEADER_HEIGHT;
    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(0.0, top, 0.0, bottom),
      end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(new CurvedAnimation(parent: animController, curve: Curves.linear));
  }

  

  Widget buildBottomSheet() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Animation<RelativeRect> animation = getPanelAnimation(constraints);
        return new PositionedTransition(
            rect: animation,
            child: new Material(
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(16.0),
                  topRight: const Radius.circular(16.0)),
              elevation: 12.0,
              child: new Column(children: <Widget>[
                new Container(
                  height: PANEL_HEADER_HEIGHT,
                  child: new Center(child: new Text("panel")),
                ),
                new Expanded(child: new Center(child: new Text("content")))
              ]),
            ),
          );
      },
    );
  }
  
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




