import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;
//the constuctor will recieve it's arguments from the main file 
  MealDetailScreen(this.toggleFavorite, this.isFavorite);


//Widgte Template 
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
//Widget template
  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String; //to get the selected meal id through route args (sent from meal Item widget )
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);  //first where is used with list to get the first matching item.
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder( // list to irtate ingerdents list
                itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(selectedMeal.ingredients[index])),
                    ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder( //list to iretate steps
                itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${(index + 1)}'),
                          ),
                          title: Text(
                            selectedMeal.steps[index],
                          ),
                        ),
                        Divider()
                      ],
                    ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),

      //the start in the meal to mark it as favorite , 
      floatingActionButton: FloatingActionButton(
        child: Icon(
           isFavorite(mealId) ? Icons.star : Icons.star_border, //if it's not in favoroite list, it will be empty star
        ),
        onPressed: () => toggleFavorite(mealId), //excute function in the main file to save item in favorite by sending item id
      ),
    );
  }
}
