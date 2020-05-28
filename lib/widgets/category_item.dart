import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
//navigate to mealsScreen with args
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      //pass args as a map of keys and values
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell( //inkWell makes it tabale
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
                //you can define const widget if the value will never be changed and the consructor of the class is defined as const

        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(             // Box Decoration is used to decorate the container

          gradient: LinearGradient(
                          //Gradient is used to  mix  colors in gradient look

            colors: [
              color.withOpacity(0.7), // withOpacity is used to make trasnparent color
              color, //the other value
            ],
            //begiaing location of the gradient and the end of it
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
                      //we can't use const on BorderRadios because it's not defined as const constcuctor

          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
