import 'package:flutter/material.dart';
import 'package:food_recipies_old_v/models/meal.dart';
import 'package:food_recipies_old_v/screens/filters_screen.dart';
import 'package:food_recipies_old_v/screens/catigories_screen.dart';
import 'package:food_recipies_old_v/screens/meal_details.dart';
import 'package:food_recipies_old_v/screens/meals_screen.dart';
import '../screens/bottom_navigation_screen.dart';

class Routs {
  static const CATIGORIES_SCREEN = '/catigories_screen';
  static const MEALS_DETAILS_SCREEN = '/meals_details_screen';
  static const MEALS_SCREEN = '/meals_screen';
  static const FILTERS_SCREEN = '/filters_screen';

  static MaterialPageRoute ONGENERATE_ROUTE(RouteSettings settings,
      {Map<String, bool>? filtersValues,
      Function? applyFilters,
      List<Meals>? mealsList,
      Function? isFavourite,
      Function? toggelFavourite,
      List<Meals>? favMeals}) {
    switch (settings.name) {
      case CATIGORIES_SCREEN:
        return MaterialPageRoute(
            builder: (_) =>
                BottomNaviagtionScreen(favoriteMeals: favMeals ?? []),
            settings: settings);
      case MEALS_DETAILS_SCREEN:
        return MaterialPageRoute(
            builder: (_) => MealDetails(
                  isFavourite: isFavourite ?? () {},
                  toggelFavourite: toggelFavourite ?? () {},
                ),
            settings: settings);
      case MEALS_SCREEN:
        return MaterialPageRoute(
            builder: (_) => MealsScreen(
                  mealsList: mealsList ?? [],
                ),
            settings: settings);
      case FILTERS_SCREEN:
        return MaterialPageRoute(
            builder: (_) => Filters(
                  filterValue: filtersValues ?? {},
                  applyFilters: applyFilters ?? () {},
                ),
            settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => CatigoriesScreen(), settings: settings);
    }
  }
}
