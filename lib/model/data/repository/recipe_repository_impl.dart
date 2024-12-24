import 'package:cook_mark/model/data/services/recipe_service.dart';
import 'package:cook_mark/model/domain/entity/recipe.dart';
import 'package:cook_mark/model/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeService service;

  const RecipeRepositoryImpl({
    required this.service,
  });

  @override
  Future<Recipe> findRecipe(String query) {
    // TODO: implement findRecipe
    throw UnimplementedError();
  }

  @override
  Future<List<Recipe>> getAllRecipes() async {
    return await service.getAllRecipes();
  }

  @override
  Future<Recipe> getRecipeById(int id) {
    // TODO: implement getRecipeById
    throw UnimplementedError();
  }

  @override
  Future<List<Recipe>> paginatedRecipes({required int limit, required int skip}) {
    // TODO: implement paginatedRecipes
    throw UnimplementedError();
  }
}
