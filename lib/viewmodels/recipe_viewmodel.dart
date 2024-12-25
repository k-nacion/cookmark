import 'dart:collection';

import 'package:cook_mark/model/domain/entity/recipe.dart';
import 'package:cook_mark/model/domain/repository/recipe_repository.dart';
import 'package:flutter/cupertino.dart';

class RecipeViewmodel extends ChangeNotifier {
  final RecipeRepository repository;
  final List<Recipe> _recipes = [];

  List<Recipe> get recipes => UnmodifiableListView(_recipes);

  RecipeViewmodel({
    required this.repository,
  });

  void getAllRecipes() async {
    final recipesFromRemote = await repository.getAllRecipes();
    _recipes.addAll(recipesFromRemote);
    notifyListeners();
  }
}
