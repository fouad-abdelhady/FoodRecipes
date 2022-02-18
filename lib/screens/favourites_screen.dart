import 'package:flutter/cupertino.dart';
import 'package:food_recipies_old_v/models/meal.dart';
import 'package:food_recipies_old_v/widgets/app_widgets/meal_item.dart';

class Favourites extends StatelessWidget {
  List<Meals> favoriteMeals;
  Favourites(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteMeals.isEmpty
          ? const Text('There are no Favourites yet]')
          : ListView.builder(
              itemBuilder: (context, index) => Center(
                child: MealItem(
                  mealId: favoriteMeals[index].id,
                  title: favoriteMeals[index].title,
                  imageUrl: favoriteMeals[index].imageUrl,
                  duration: favoriteMeals[index].duration,
                  affordability: favoriteMeals[index].affordable,
                  complexity: favoriteMeals[index].complexity,
                ),
              ),
              itemCount: favoriteMeals.length,
            ),
    );
  }
}
