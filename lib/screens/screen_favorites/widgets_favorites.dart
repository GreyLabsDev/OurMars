import 'package:flutter/material.dart';
import 'package:our_mars/data/db/Database.dart';
import 'package:our_mars/data/model/models.dart';
import 'package:our_mars/screens/screen_photo/screen_photo.dart';

class ImageListGrid extends StatelessWidget {
  final List<PhotoModel> photos;

  const ImageListGrid({Key key, @required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageItems =
        photos.map((model) => ImageListItem(photoModel: model)).toList();
    return SliverGrid.count(
      crossAxisCount: 3,
      children: imageItems,
    );
  }
}

class ImageListItem extends StatelessWidget {
  final PhotoModel photoModel;

  ImageListItem({Key key, this.photoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScreenPhoto(
                      photoModel: photoModel,
                    )));
      },
      child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(this.photoModel.imageUrl)),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.grey,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 8,
                left: 8,
                child: StatefullFavoriteButton(photoModel),
              )
            ],
          )),
    );
  }
}

class StatefullFavoriteButton extends StatefulWidget {
  PhotoModel photoModel;

  StatefullFavoriteButton(this.photoModel);

  @override
  State<StatefulWidget> createState() =>
      StatefullFavoriteButtonState(photoModel);
}

class StatefullFavoriteButtonState extends State {
  PhotoModel photoModel;
  bool isFavorite = false;

  StatefullFavoriteButtonState(this.photoModel);

  @override
  void initState() {
    if (photoModel.isFavorite == 1) {
      isFavorite = true;
    } else
      isFavorite = false;
    super.initState();
  }

  void updatePhotoInDB() async {
    DBProvider.db.insertPhotoModel(photoModel);
  }


  void onFavoritePressed() {
    isFavorite = !isFavorite;
    if (isFavorite) {
      photoModel.isFavorite = 1;
    } else
      photoModel.isFavorite = 0;

    updatePhotoInDB();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.white),
      onTap: onFavoritePressed,
    );
  }
}
