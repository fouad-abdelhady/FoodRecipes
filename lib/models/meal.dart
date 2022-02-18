import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordability { Affordable, Pricey, Luxurious }

class Meals {
  @required
  final String id;
  final String title;
  final String imageUrl;

  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  final double duration;

  final List<String> catigories;
  final List<String> ingredients;
  final List<String> steps;

  final Complexity complexity;
  final Affordability affordable;

  Meals(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.duration,
      required this.catigories,
      required this.ingredients,
      required this.steps,
      required this.complexity,
      required this.affordable});
}
