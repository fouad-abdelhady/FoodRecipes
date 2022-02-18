import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_recipies_old_v/config/routs.dart';
import './screens/bottom_navigation_screen.dart';
import 'package:food_recipies_old_v/widgets/platform_based_widgets/app_scaffold.dart';
import 'data/catigories_data.dart';
import 'models/meal.dart';
import 'screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  static final DEVICE_PLATFORM = Platform.isIOS;
  Map<String, bool> mealsFilters = {
    Filters.GLUTEN: false,
    Filters.VEGAN: false,
    Filters.VEGETARIAN: false,
    Filters.LACTOSE: false
  };
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meals>? filteredList;
  List<Meals> favouriteMeals = [];

  applyFilters({required Map<String, bool> filters}) {
    widget.mealsFilters = filters;
    filteredList = DUMMY_MEALS.where((meal) {
      if (filters[Filters.GLUTEN] == true && !meal.isGlutenFree) return false;
      if (filters[Filters.VEGAN] == true && !meal.isVegan) return false;
      if (filters[Filters.VEGETARIAN] == true && !meal.isVegetarian) {
        return false;
      }
      if (filters[Filters.LACTOSE] == true && !meal.isLactoseFree) return false;
      return true;
    }).toList();
  }

  isFavourite(mealId) => favouriteMeals.any((meal) => meal.id == mealId);

  toggleFavouriteMeal(mealId) {
    var index = favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (index < 0) {
      favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    } else {
      favouriteMeals.removeAt(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.indigo[700], secondary: Colors.amber[900]),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                fontFamily: "RobotoCondensed",
              ),
              headline5: const TextStyle(
                fontFamily: 'RobotoCondensed',
              )),
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              toolbarTextStyle: TextStyle(
                fontFamily: 'RobotoCondensed',
              ))),
      title: "Food Recipes",
      routes: {
        '/': (context) => BottomNaviagtionScreen(
              favoriteMeals: favouriteMeals,
            ),
      },
      onGenerateRoute: (settings) => Routs.ONGENERATE_ROUTE(settings,
          applyFilters: applyFilters,
          filtersValues: widget.mealsFilters,
          mealsList: filteredList ?? DUMMY_MEALS,
          isFavourite: isFavourite,
          toggelFavourite: toggleFavouriteMeal,
          favMeals: favouriteMeals),
    );
  }
}

class HomePage extends StatelessWidget {
  ///ture if the platform is IOS other Android
  final appBarTitle = "Catigories";

  Widget getBody() {
    return const SafeArea(child: Center(child: Text("Hello World !")));
  }

  @override
  Widget build(BuildContext context) {
    Widget getAppBarTitle() {
      return Center(
          child: Text(
        appBarTitle,
        style: Theme.of(context).textTheme.headline6,
      ));
    }

    return AppScaffold(
      appBarTitle: "Home Page",
      pageBody: getBody(),
    );
  }
}
