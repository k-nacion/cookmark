import 'package:cook_mark/model/data/repository/recipe_repository_impl.dart';
import 'package:cook_mark/model/domain/entity/recipe.dart';
import 'package:cook_mark/model/domain/repository/recipe_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeNotifier extends StateNotifier<List<Recipe>> {
  final RecipeRepository repository;

  RecipeNotifier(super.state, this.repository);

  void getAllRecipes() async {
    final allRecipes = await repository.getAllRecipes();

    state = [...allRecipes];
  }
}

final recipeViewModelProvider = StateNotifierProvider<RecipeNotifier, List<Recipe>>((ref) {
  return RecipeNotifier([], ref.read(recipeRepositoryProvider));
});
