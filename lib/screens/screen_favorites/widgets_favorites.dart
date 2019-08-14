import 'package:flutter/material.dart';

class ImageListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
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
