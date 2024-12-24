import 'package:cook_mark/model/domain/entity/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getAllRecipes();
  Future<Recipe> getRecipeById(int id);
  Future<Recipe> findRecipe(String query);
  Future<List<Recipe>> paginatedRecipes({required int limit, required int skip});
}
