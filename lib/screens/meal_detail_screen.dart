import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item_trait.dart';
import 'package:meal_app/widgets/string_extension.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal, required this.onToggleFavorits});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorits;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(meal.title),
          actions: [
            IconButton(
                onPressed: () {
                  onToggleFavorits(meal);
                },
                icon: const Icon(Icons.star))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                height: 300,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const Spacer(),
                          MealItemTrait(
                              icon: Icons.currency_rupee,
                              label: meal.affordability.name.capitalize()),
                          const Spacer(),
                          MealItemTrait(
                              icon: Icons.work,
                              label: meal.complexity.name.capitalize()),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'ingredient:',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      for (final ingredient in meal.ingredients)
                        Text(
                          ingredient,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Steps:',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      for (final step in meal.steps)
                        Text(
                          step,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        )
                    ],
                  )),
            ],
          ),
        ));
  }
}
