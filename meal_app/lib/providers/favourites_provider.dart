import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/models/meal_models.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> { //StateNotifier(): for stateful widgets
  FavouriteMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});