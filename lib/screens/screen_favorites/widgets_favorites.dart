import 'package:flutter/material.dart';
import 'package:our_mars/data/api/nasa_api.dart';
import 'package:our_mars/data/model/models.dart';

class ImageListGrid extends StatelessWidget {
  final List<PhotoModel> photos;

  const ImageListGrid({Key key, @required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageItems = photos.map((model) => ImageListItem(imageUrl: model.imageUrl, isFavorite: false,)).toList();
    return SliverGrid.count(
      crossAxisCount: 3,
      children: imageItems,
    );
  }
}

class ImageListItem extends StatelessWidget {
  final String imageUrl;
  final bool isFavorite;

  ImageListItem({Key key, this.imageUrl, this.isFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageUrl)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.redAccent,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 8,
              left: 8,
              child: StatefullFavoriteButton(isFavorite),
            )
          ],
        ));
  }
}

class StatefullFavoriteButton extends StatefulWidget {
  bool isFavorite;

  StatefullFavoriteButton(this.isFavorite);

  @override
  State<StatefulWidget> createState() =>
      StatefullFavoriteButtonState(isFavorite);
}

class StatefullFavoriteButtonState extends State {
  bool isFavorite;

  StatefullFavoriteButtonState(this.isFavorite);

  void onFavoritePressed() {
    isFavorite = !isFavorite;
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
