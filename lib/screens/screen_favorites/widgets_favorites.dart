import 'package:flutter/material.dart';
import 'package:our_mars/data/model/models.dart';
import 'package:our_mars/screens/screen_photo/screen_photo.dart';

class ImageListGrid extends StatelessWidget {
  final List<PhotoModel> photos;
  Function(bool isFavorite, PhotoModel photoFavoritePressed) onPhotoFavoritePressed;

  ImageListGrid({Key key, @required this.photos, this.onPhotoFavoritePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageItems =
        photos.map((model) => ImageListItem(photoModel: model, onPhotoFavoritePressed: onPhotoFavoritePressed,)).toList();
    return SliverGrid.count(
      crossAxisCount: 3,
      children: imageItems,
    );
  }
}

class ImageListItem extends StatelessWidget {
  final PhotoModel photoModel;
  Function(bool isFavorite, PhotoModel photoFavoritePressed) onPhotoFavoritePressed;

  ImageListItem({Key key, this.photoModel, this.onPhotoFavoritePressed}) : super(key: key);

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
                child: StatefulFavoriteButton(photoModel,onPhotoFavoritePressed),
              )
            ],
          )),
    );
  }
}

class StatefulFavoriteButton extends StatefulWidget {
  PhotoModel photoModel;
  Function(bool isFavorite, PhotoModel photoFavoritePressed) onPhotoFavoritePressed;

  StatefulFavoriteButton(this.photoModel, this.onPhotoFavoritePressed);

  @override
  State<StatefulWidget> createState() =>
      StatefullFavoriteButtonState(photoModel, onPhotoFavoritePressed);
}

class StatefullFavoriteButtonState extends State {
  PhotoModel photoModel;
  bool isFavorite = false;
  Function(bool isFavorite, PhotoModel photoFavoritePressed) onPhotoFavoritePressed;

  StatefullFavoriteButtonState(this.photoModel, this.onPhotoFavoritePressed);

  @override
  void initState() {
    if (photoModel.isFavorite == 1) {
      isFavorite = true;
    } else
      isFavorite = false;
    super.initState();
  }

  void onFavoritePressed() {
    isFavorite = !isFavorite;
    onPhotoFavoritePressed(isFavorite, photoModel);
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
