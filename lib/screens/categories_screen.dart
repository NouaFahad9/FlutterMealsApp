import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

          //GridView is like ListView but it can have items next to each other in rows

    return GridView(
      padding: const EdgeInsets.all(25),
      //map function  iretate every item in list and apply function to each item and return value
        //this map here will go through every item in dummyList and sent its data to categoryItem and return list of category item widget
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color,
                ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //sliver in flutter responsible for scrolling wich is deafult feature in GridView
          //GridDelegate is the structure  of that Grid layout
          //withMaxCrossAxisExtent is a preconfigred class that allows us to define maximum width for each grid item.
        maxCrossAxisExtent: 200, /// if we have device with 300 Px, it will display only one item in row, if it 400 it will show two.
        childAspectRatio: 3 / 2, // the aspect ratio of height to the width (this means 300 height to 200 width)
        crossAxisSpacing: 20, //spacing between items
        mainAxisSpacing: 20,
      ),
    );
  }
}
