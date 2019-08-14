import 'package:flutter/material.dart';

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
            Align(
              alignment: Alignment.bottomLeft,
              child: StatefullFavoriteButton(isFavorite),
            ),
          ],
        ));
  }
}

class StatefullFavoriteButton extends StatefulWidget {
  bool isFavorite;

  StatefullFavoriteButton(this.isFavorite)

  @override
  State<StatefulWidget> createState() => StatefullFavoriteButtonState(isFavorite);

}

class StatefullFavoriteButtonState extends State {
  bool isFavorite;

  StatefullFavoriteButtonState(this.isFavorite);

  void onFavortePressed() {
    isFavorite = !isFavorite;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.white),
      onPressed: onFavortePressed,
    );
  }

}
