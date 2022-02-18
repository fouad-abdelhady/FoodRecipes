import 'package:flutter/material.dart';
import 'package:food_recipies_old_v/models/meal.dart';
import 'package:food_recipies_old_v/screens/catigories_screen.dart';
import 'package:food_recipies_old_v/screens/favourites_screen.dart';
import 'package:food_recipies_old_v/widgets/app_widgets/drawer.dart';

class BottomNaviagtionScreen extends StatefulWidget {
  List<Meals> favoriteMeals;
  BottomNaviagtionScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  _BottomNaviagtionScreen createState() => _BottomNaviagtionScreen();
}

class _BottomNaviagtionScreen extends State<BottomNaviagtionScreen> {
  static const _PAGE_KEY = 'page';
  static const _TITLE_KEY = 'title';
  // ignore: non_constant_identifier_names
  late final botmNavBarScreens;
  var _selectedIndex = 0;
  @override
  void initState() {
    botmNavBarScreens = [
      {'page': CatigoriesScreen(), 'title': 'Categories'},
      {'page': Favourites(widget.favoriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            botmNavBarScreens.elementAt(_selectedIndex)[_TITLE_KEY].toString()),
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        onTap: switchScreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite')
        ],
      ),
      body: botmNavBarScreens.elementAt(_selectedIndex)[_PAGE_KEY] as Widget,
    );
  }

  void switchScreen(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
