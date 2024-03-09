import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorits});
  final void Function(Meal meal) onToggleFavorits;
  @override
  Widget build(BuildContext context) {
    void selectCategory(BuildContext context, Category category) {
      final filteredMeal = dummyMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              MealsScreen(title: category.title, meals: filteredMeal, onToggleFavorits: onToggleFavorits)));
    }

    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectedCategory: () {
              selectCategory(context, category);
            },
          )
      ],
    );
  }
}
