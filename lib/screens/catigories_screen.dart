import 'package:flutter/cupertino.dart';
import 'package:food_recipies_old_v/data/catigories_data.dart';
import '../widgets/app_widgets/category_item.dart';

class CatigoriesScreen extends StatelessWidget {
  static const String TITLE = "Catigories";
  @override
  Widget build(BuildContext context) {
    return _getBody();
    // return AppScaffold(appBarTitle: TITLE, pageBody: _getBody());
  }

  Widget _getBody() => GridView(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
      children: DUMMY_CATEGORIES
          .map((catItemData) => CategoryItem(
              catItemData.title, catItemData.color, catItemData.id))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20));
}
