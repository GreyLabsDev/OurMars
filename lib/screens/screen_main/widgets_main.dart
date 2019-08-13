
import 'package:flutter/material.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/resources/style.dart';

enum RoverType {
  Curiosity,
  Opportunity,
  Sprit
}

class StatelessRoversPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.8
        ),
        children: <Widget>[
          StatelessRoverCard(roverType: RoverType.Opportunity, padding: EdgeInsets.only(left: 8.0, right: 8.0),),
          StatelessRoverCard(roverType: RoverType.Curiosity, padding: EdgeInsets.only(left: 8.0, right: 8.0),),
          StatelessRoverCard(roverType: RoverType.Sprit, padding: EdgeInsets.only(left: 8.0, right: 8.0),),
        ],
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
  final String yearString;
  final Function() onTap;

  StatefulYearSelectorWidgetState(this.yearString, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(yearString, style: AppStyles.text_style_year,),
        SizedBox(width: 8.0,),
        Icon(Icons.arrow_drop_down, color: Colors.white,)
      ],
    );
  }
}

class StatefulMonthChipsGroup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StatefulMonthChipsGroupState();

}

class StatefulMonthChipsGroupState extends State {
  int selectedMonthPos = null;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppStrings.monthsList.length,
          itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                child: StatelessMonthChip(
                  monthName: AppStrings.monthsList[index],
                  isSelected: index == selectedMonthPos,
                ),
              );
            },
        );
  }
}

class StatelessMonthChip extends StatelessWidget {
  final String monthName;
  final bool isSelected;
  Function() onTap;

  StatelessMonthChip({Key key, this.monthName, this.isSelected, this.onTap}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0, right: 16.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white, width: 1.0),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(22.0),
          color: isSelected ? Colors.white : Colors.transparent
        ),
      child: Text(
        monthName, 
        style: isSelected ? AppStyles.text_style_default_dark : AppStyles.text_style_default,),
    );
  }

}