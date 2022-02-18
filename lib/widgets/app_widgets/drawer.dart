import 'package:flutter/material.dart';
import '../../config/routs.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blue[900]),
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(bottom: 10, left: 20),
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          getListTile(
            icon: const Icon(Icons.restaurant),
            text: 'Meals',
            function: () {
              Navigator.of(context)
                  .pushReplacementNamed(Routs.CATIGORIES_SCREEN);
            },
          ),
          getListTile(
            icon: const Icon(Icons.filter_alt_sharp),
            text: 'Filters',
            function: () {
              Navigator.of(context).pushReplacementNamed(Routs.FILTERS_SCREEN);
            },
          )
        ],
      ),
    );
  }

  void func2() {}

  getListTile(
          {required Icon icon,
          required String text,
          required VoidCallback function}) =>
      ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        onTap: function,
      );
}
