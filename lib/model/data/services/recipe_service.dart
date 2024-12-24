import 'dart:convert';

import 'package:cook_mark/model/data/dto/recipe_dto.dart';
import 'package:cook_mark/model/data/services/http_client.dart';
import 'package:cook_mark/model/domain/entity/recipe.dart';

class RecipeService {
  static const baseUrl = 'https://dummyjson.com/recipes';

  final HttpClient client;

  const RecipeService({
    required this.client,
  });

  Future<List<Recipe>> getAllRecipes() async {
    final responseBody = await client.read(Uri.parse(baseUrl));
    final List<dynamic> recipeList = jsonDecode(responseBody)['recipes'];
    final List<Recipe> recipes = [];

    for (var recipe in recipeList) {
      final recipeDto = RecipeDTO.fromMap(recipe);
      recipe.add(Recipe.fromDTO(recipeDto));
    }

    return recipes;
  }
}
