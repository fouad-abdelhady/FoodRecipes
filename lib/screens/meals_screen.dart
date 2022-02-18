import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipies_old_v/models/meal.dart';
import 'package:food_recipies_old_v/widgets/app_widgets/meal_item.dart';
import 'package:food_recipies_old_v/widgets/platform_based_widgets/app_scaffold.dart';
import 'package:food_recipies_old_v/data/catigories_data.dart';

class MealsScreen extends StatefulWidget {
  List<Meals> mealsList;
  MealsScreen({required this.mealsList});
  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  late String pageTitle;
  var isLoaded = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (isLoaded) return;

    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    pageTitle = arguments['title'];
    final catigoryId = arguments['id'];
    widget.mealsList = widget.mealsList
        .where((meal) => meal.catigories.contains(catigoryId))
        .toList();
    isLoaded = true;
  }

  deleteRecipie({required String mealId}) {
    setState(() {
      widget.mealsList.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: pageTitle,
      pageBody: ListView.builder(
        itemBuilder: (context, index) {
          return Center(
            child: MealItem(
              mealId: widget.mealsList[index].id,
              title: widget.mealsList[index].title,
              imageUrl: widget.mealsList[index].imageUrl,
              duration: widget.mealsList[index].duration,
              affordability: widget.mealsList[index].affordable,
              complexity: widget.mealsList[index].complexity,
            ),
          );
        },
        itemCount: widget.mealsList.length,
      ),
    );
  }
}
