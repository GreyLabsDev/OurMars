
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/resources/style.dart';

enum RoverType {
  Curiosity,
  Opportunity,
  Sprit
}

class StatelessRoversPager extends StatelessWidget {
  Function(RoverType type, int index) onRoverPageChanged;
  int lastPage;
  
  StatelessRoversPager({this.onRoverPageChanged, this.lastPage = 1});
  var rovers = [
    RoverType.Opportunity,
    RoverType.Curiosity,
    RoverType.Sprit
  ];
  var roversCards = [
          StatelessRoverCard(roverType: RoverType.Opportunity, padding: EdgeInsets.only(left: 8.0, right: 8.0),),
          StatelessRoverCard(roverType: RoverType.Curiosity, padding: EdgeInsets.only(left: 8.0, right: 8.0),),
          StatelessRoverCard(roverType: RoverType.Sprit, padding: EdgeInsets.only(left: 8.0, right: 8.0),),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      child: PageView(
        onPageChanged: (index) {
          lastPage = index;
          onRoverPageChanged(rovers[index], index);
        },
        scrollDirection: Axis.horizontal,
        controller: PageController(
          initialPage: lastPage,
          viewportFraction: 0.8
        ),
        children: roversCards,
      ),
    );
  }
}

class StatelessRoverCard extends StatelessWidget {
  final RoverType roverType;
  EdgeInsetsGeometry padding;
  Function() onTap;
  
  StatelessRoverCard({Key key, this.padding = const EdgeInsets.all(0.0), this.onTap, this.roverType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider assetImage;
    String roverName;

    switch (roverType) {
      case RoverType.Curiosity:
        assetImage = AssetImage("assets/img_rover_curiosity.png");
        roverName = AppStrings.rover_name_curiosity;
        break;
      case RoverType.Opportunity:
        assetImage = AssetImage("assets/img_rover_opportunity.png");
        roverName = AppStrings.rover_name_opportunity;
        break;
      case RoverType.Sprit:
        assetImage = AssetImage("assets/img_rover_spirit.png");
        roverName = AppStrings.rover_name_spirit;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        child: Stack(
          children: <Widget>[
            Container( 
              height: 160.0,
              padding: padding,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: assetImage,
                ),
                borderRadius:  BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [Colors.black87, Colors.transparent],
                    begin: const FractionalOffset(0.0, 1.0),
                    end: const FractionalOffset(0.0, 0.0)
                  ),
                  borderRadius: BorderRadius.circular(16.0)
                ),
                padding: EdgeInsets.all(16.0),
                child: Text(roverName, style: AppStyles.text_style_default,),
              ),
            ),
          ],
        ) 
      ),
    );
  }
}


class StatefulYearSelectorWidget extends StatefulWidget {
  final String yearString;
  final Function() onTap;

  const StatefulYearSelectorWidget({Key key, this.yearString, this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StatefulYearSelectorWidgetState(yearString, onTap);
}

class StatefulYearSelectorWidgetState extends State {
  String yearString;
  final Function() onTap;

  StatefulYearSelectorWidgetState(this.yearString, this.onTap);
  @override
  void setState(fn) {
    super.setState(fn);
  }

  void updateYear(String newYearString) {
    yearString = newYearString;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Text(yearString, style: AppStyles.text_style_year,),
          SizedBox(width: 8.0,),
          Icon(Icons.arrow_drop_down, color: Colors.white,)
        ],
      ),
    );
  }
}

class StatefulMonthChipsGroup extends StatefulWidget {
  final Function(int selectedMonthPos) onTap;
  int selectedMonthPos;
  
  StatefulMonthChipsGroup({Key key, this.onTap, this.selectedMonthPos}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StatefulMonthChipsGroupState(onTap:(int month) {
     selectedMonthPos = month - 1;
     onTap(month);
  }, selectedMonthPos: selectedMonthPos);

}

class StatefulMonthChipsGroupState extends State {
  final Function(int selectedMonthPos) onTap;
  int selectedMonthPos;

  StatefulMonthChipsGroupState({this.onTap, this.selectedMonthPos});

  void updateChipsState(int selectedChip) {
    setState(() {
      if (selectedMonthPos == null || selectedMonthPos != selectedChip) {
        selectedMonthPos = selectedChip;
        onTap(selectedMonthPos+1 );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppStrings.monthsList.length,
          itemBuilder: (BuildContext context, int index) {
            var isChipSelected = selectedMonthPos == index;
            return new Padding(
              padding: EdgeInsets.only(left: 4.0,  right: 4.0),
              child: StatelessMonthChip(
                monthName: AppStrings.monthsList[index],
                isSelected: isChipSelected,
                onTap: () {updateChipsState(index);},
              ),
            );
          },
      );
  }
}

class StatelessMonthChip extends StatelessWidget {
  final String monthName;
  bool isSelected;
  Function() onTap;

  StatelessMonthChip({Key key, this.monthName, this.isSelected, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: new Container(
        padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0, right: 16.0),
        decoration: new BoxDecoration(
            border: new Border.all(color: Colors.white, width: 1.0),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(22.0),
            color: isSelected ? Colors.white : Colors.transparent
          ),
        child: new Text(
          monthName, 
          style: isSelected ? AppStyles.text_style_default_dark : AppStyles.text_style_default,),
      ),
    );
  }

}

class StatelessBottomSheetMenuContent extends StatelessWidget {
  Function() onFavoritesClick;
  Function() onAboutClick;

  StatelessBottomSheetMenuContent({Key key, this.onAboutClick, this.onFavoritesClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 8.0,),
        Container(width: 48.0, height: 2.0, color: Colors.grey,),
        SizedBox(height: 32.0,),
        InkWell(
          onTap: onFavoritesClick,
          child: Text(AppStrings.button_favorites, style: AppStyles.text_style_default,),
        ),
        SizedBox(height: 8.0,),
        Padding(
          padding: EdgeInsets.only(left: 32.0, right: 32.0),
          child: Container(height: 1.0, color: Colors.grey,),
        ),
        SizedBox(height: 8.0,),
        InkWell(
          onTap: onAboutClick,
          child: Text(AppStrings.button_about, style: AppStyles.text_style_default,),
        )
      ],
    );
  }
}

class SemiRoundedBorderContainer extends StatelessWidget {
  final BorderSide borderSide;
  final Radius radius;
  final Color background;
  final Widget child;
  final double height;

  const SemiRoundedBorderContainer({
    Key key,
    @required this.borderSide,
    @required this.radius,
    @required this.background,
    @required this.child,
    @required this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: height,
      width: double.infinity,
      child: ClipRect(
        clipper: new SemiRoundedBorderClipper(borderSide.width + 1.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child:  new DecoratedBox(
            decoration: new ShapeDecoration(
              shape: new RoundedRectangleBorder(
                side: borderSide,
                borderRadius: new BorderRadius.only(
                  topLeft: radius,
                  topRight: radius,
                ),
              ),
            ),
            child: child,
          ),
        )
      ),
    );
  }
}

class SemiRoundedBorderClipper extends CustomClipper<Rect> {
  final double borderStrokeWidth;

  const SemiRoundedBorderClipper(this.borderStrokeWidth);

  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(0.0, 0.0, size.width, size.height - borderStrokeWidth);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    if (oldClipper.runtimeType != SemiRoundedBorderClipper) return true;
    return (oldClipper as SemiRoundedBorderClipper).borderStrokeWidth != borderStrokeWidth;
  }
}
