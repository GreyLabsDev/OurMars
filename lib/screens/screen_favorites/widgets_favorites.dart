import 'package:flutter/material.dart';

class ImageListItem extends StatelessWidget {
  final String imageUrl;
  final bool isFavorite;

  ImageListItem({Key key, this.imageUrl, this.isFavorite}) : super(key: key);

  Icon buildFavoriteIcon() {
    if (isFavorite) {
      return Icon(Icons.favorite, color: Colors.white);
    } else return Icon(Icons.favorite_border, color: Colors.white);
  }

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
              left: 8.0,
              bottom: 8.0,
              child: buildFavoriteIcon(),
            ),
          ],
        ));
  }
}
