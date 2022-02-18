import 'package:flutter/material.dart';
import 'package:food_recipies_old_v/data/catigories_data.dart';
import 'package:food_recipies_old_v/widgets/platform_based_widgets/app_scaffold.dart';
import 'package:food_recipies_old_v/models/meal.dart';

class MealDetails extends StatefulWidget {
  static const EXPANDED_HEIGHT = 250.0;
  Function toggelFavourite;
  Function isFavourite;

  MealDetails({required this.toggelFavourite, required this.isFavourite});

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  bool speicalMode = false;

  Meals getMealById({required String mealId}) {
    print('the index is $mealId');
    return DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
  }

  Widget _getscreenBody(Meals meal, BuildContext context) {
    return CustomScrollView(
      slivers: [
        _getSliverAppBar(meal.imageUrl),
        _getSectionTitle(context, 'Ingredients'),
        _getIngredientsSection(meal, context),
        _getSectionTitle(context, 'Steps'),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: speicalMode ? Colors.amberAccent : Colors.blue,
                        ),
                        child: Center(
                            child: Text(
                          '${index + 1}',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: speicalMode
                                      ? Colors.grey[900]
                                      : Colors.white),
                        )),
                      ),
                      title: Text(
                        meal.steps[index],
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                childCount: meal.steps.length))
      ],
    );
  }

  SliverToBoxAdapter _getSectionTitle(BuildContext context, String title) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Divider(),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _getIngredientsSection(Meals meal, BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      margin: EdgeInsets.only(top: 10),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        runSpacing: 10,
        direction: Axis.horizontal,
        children: meal.ingredients
            .map((ingredient) => _getIngredientItem(ingredient, context))
            .toList(),
      ),
    ));
  }

  Widget _getIngredientItem(String ingredient, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: speicalMode
              ? Colors.amber[800]
              : Theme.of(context).colorScheme.primary),
      child: Text(
        ingredient,
        style: Theme.of(context)
            .textTheme
            .caption!
            .copyWith(color: speicalMode ? Colors.grey[900] : Colors.white),
      ),
    );
  }

  SliverToBoxAdapter _getSliverAppBar(String mealUrl) {
    return SliverToBoxAdapter(
      child: Container(
        height: MealDetails.EXPANDED_HEIGHT,
        child: Image.network(
          mealUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mealId = ModalRoute.of(context)!.settings.arguments as String;
    Meals meal = getMealById(mealId: mealId);
    //speicalMode = meal.id == SPECIAL_ID;
    return AppScaffold(
      //specialMode: meal.id == SPECIAL_ID,
      appBarTitle: meal.title,
      pageBody: _getscreenBody(meal, context),
      floatingAcButton: getFloatingActionButton(context, mealId),
    );
  }

  FloatingActionButton getFloatingActionButton(
          BuildContext context, String mealId) =>
      FloatingActionButton(
        child: Icon(widget.isFavourite(mealId)
            ? Icons.favorite
            : Icons.favorite_outline),
        onPressed: () {
          setState(() {
            widget.toggelFavourite(mealId);
          });
        },
      );
}
