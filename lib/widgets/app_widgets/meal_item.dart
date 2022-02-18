import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipies_old_v/models/meal.dart';
import 'package:food_recipies_old_v/config/routs.dart';

class MealItem extends StatelessWidget {
  static const _RADIOUS = 15.0;

  final String mealId;
  final String title;
  final String imageUrl;

  final double duration;

  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.mealId,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });
  String get getAffordabiliy {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return "Undefined";
    }
  }

  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Challenging:
        return "Challenging";
      default:
        return "Undefined";
    }
  }

  void _moveToDetailsScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamed(Routs.MEALS_DETAILS_SCREEN, arguments: mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_RADIOUS),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(_RADIOUS),
                    topRight: Radius.circular(_RADIOUS)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.black54,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white, fontFamily: 'Inconsolata'),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              Positioned.fill(
                  child: Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  onTap: () => _moveToDetailsScreen(context),
                  splashColor: Theme.of(context).colorScheme.primary,
                ),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.timer),
                    SizedBox(
                      width: 5,
                    ),
                    Text("$duration mints")
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money_sharp),
                    Text("$getAffordabiliy")
                  ],
                ),
                Row(
                  children: [Icon(Icons.blender), Text("$getComplexity")],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
