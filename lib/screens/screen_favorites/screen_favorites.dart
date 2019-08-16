import 'package:flutter/material.dart';
import 'package:our_mars/bloc/block_rover_photo.dart';
import 'package:our_mars/data/repository/repository.dart';
import 'package:our_mars/resources/colors.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/resources/style.dart';
import 'package:our_mars/screens/screen_favorites/widgets_favorites.dart';

class ScreenFavorites extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenFavoritesState();
}

class ScreenFavoritesState extends State {
  BlocRoverPhotos roverPhotosBloc;

  @override
  void initState() {
    roverPhotosBloc = BlocRoverPhotos(RoversPhotoRepository());
    super.initState();
    roverPhotosBloc.getFavoritePhotos();
  }

  @override
  void dispose() {
    roverPhotosBloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
        /* child: Text(AppStrings.screen_favorites_title, style: AppStyles.text_style_title,),*/
            child: CustomScrollView(  
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Row(
                      children: <Widget>[
                          GestureDetector(
                            onTap: () {Navigator.pop(context);},
                            child: Icon(Icons.arrow_back, color: Colors.white,),
                          ),
                          SizedBox(width: 16.0,),
                          Text(AppStrings.screen_favorites_title, style: AppStyles.text_style_title,),
                        ],
                      ),
                    )
                  ]),
                ),
                StreamBuilder<BlocRoverPhotosState>(
                        stream: roverPhotosBloc.roverPhotosState,
                        initialData: BlocRoverPhotosStateInitial(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data is BlocRoverPhotosStateInitial) {
                            return SliverList(delegate: SliverChildListDelegate([Text("Initial", style: AppStyles.text_style_default,)]),);
                          }
                          if (snapshot.data is BlocRoverPhotosStateLoading) {
                            return SliverList(delegate: SliverChildListDelegate([Text("Loading...", style: AppStyles.text_style_default,)]),);
                          }
                          if (snapshot.data is BlocRoverPhotosStateData) {
                            BlocRoverPhotosStateData state = snapshot.data;
                            if (state.photos.length > 0) {
                              return ImageListGrid(
                                  photos: state.photos,
                                  onPhotoFavoritePressed: (isFavorite, photo) {
                                    roverPhotosBloc.removeFavoritePhotoAndReload(photo);
                                  },
                                );
                            } else return SliverList(delegate: SliverChildListDelegate([Text("No photo in favorites", style: AppStyles.text_style_default,)]),);
                          }
                          if (snapshot.data is BlocRoverPhotosStateError) {
                            BlocRoverPhotosStateError state = snapshot.data;
                            return SliverList(delegate: SliverChildListDelegate([Text(state.errorMessage, style: AppStyles.text_style_default,)]),);
                          }
                        },
                      ),
              ],
            ),
          )),
        );
      }
}

