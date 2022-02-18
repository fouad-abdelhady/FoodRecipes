import 'package:flutter/material.dart';
import 'package:food_recipies_old_v/widgets/app_widgets/drawer.dart';

class Filters extends StatefulWidget {
  static const GLUTEN = 'gluten',
      VEGAN = 'vegan',
      VEGETARIAN = 'vegetarian',
      LACTOSE = "lactose";

  Function applyFilters;
  Map<String, bool> filterValue;
  Filters({Key? key, required this.applyFilters, required this.filterValue})
      : super(key: key);
  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var isGlutenFree = false,
      isVegan = false,
      isVegetarian = false,
      isLactoseFree = false;

  @override
  initState() {
    super.initState();
    isGlutenFree = widget.filterValue[Filters.GLUTEN] ?? false;
    isVegan = widget.filterValue[Filters.VEGAN] ?? false;
    isVegetarian = widget.filterValue[Filters.VEGETARIAN] ?? false;
    isLactoseFree = widget.filterValue[Filters.LACTOSE] ?? false;
  }

  Widget getSwitchListTile(
          {required bool value,
          required onChanged,
          required title,
          required subtTitle}) =>
      SwitchListTile(
          value: value,
          onChanged: onChanged,
          title: Text(title),
          subtitle: Text(subtTitle));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 30),
            child: Center(
              child: Text(
                'Set Recipies Filters! ',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                getSwitchListTile(
                    value: isGlutenFree,
                    onChanged: (newVal) {
                      setState(() {
                        isGlutenFree = newVal;
                      });
                    },
                    title: "Gluten Free",
                    subtTitle: "Switch this on for Gluten free recipies"),
                getSwitchListTile(
                    value: isVegan,
                    onChanged: (newVal) {
                      setState(() {
                        isVegan = newVal;
                      });
                    },
                    title: "Vegan",
                    subtTitle: "Switch this on for Vegan recipies"),
                getSwitchListTile(
                    value: isVegetarian,
                    onChanged: (newVal) {
                      setState(() {
                        isVegetarian = newVal;
                      });
                    },
                    title: "Vegetarian",
                    subtTitle: "Switch this on for Vegetarian recipies"),
                getSwitchListTile(
                    value: isLactoseFree,
                    onChanged: (newVal) {
                      setState(() {
                        isLactoseFree = newVal;
                      });
                    },
                    title: "Lactose Free",
                    subtTitle: "Switch this on for Lactose free recipies"),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 30),
                  height: 100,
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          widget.applyFilters(filters: {
                            Filters.GLUTEN: isGlutenFree,
                            Filters.VEGAN: isVegan,
                            Filters.VEGETARIAN: isVegetarian,
                            Filters.LACTOSE: isLactoseFree
                          });
                        },
                        child: const SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                'Save Current Selection',
                              ),
                            ))),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
