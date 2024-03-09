import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorits});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorits;
  @override
  Widget build(BuildContext context) {
    void mealDetail(BuildContext context, Meal meal) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MealDetailScreen(
              meal: meal, onToggleFavorits: onToggleFavorits)));
    }

    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onSelectMeal: () {
          mealDetail(context, meals[index]);
        },
      ),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Uh oh... nothing here',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selection a different category',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(title!),
      ),
      body: content,
    );
  }
}
