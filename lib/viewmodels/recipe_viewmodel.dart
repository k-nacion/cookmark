import 'dart:collection';

import 'package:cook_mark/model/domain/entity/recipe.dart';
import 'package:cook_mark/model/domain/repository/recipe_repository.dart';
import 'package:flutter/cupertino.dart';

class RecipeViewmodel extends ChangeNotifier {
  final RecipeRepository repository;
  final List<Recipe> _recipes = [];
  bool _isFetching = false;
  bool get isFetching => _isFetching;

  List<Recipe> get recipes => UnmodifiableListView(_recipes);

  RecipeViewmodel({
    required this.repository,
  }) {
    getAllRecipes();
  }

  void getAllRecipes() async {
    if (_isFetching) return; // Prevent multiple calls
    _isFetching = true;
    notifyListeners();

    try {
      final recipesFromRemote = await repository.getAllRecipes();
      _recipes.addAll(recipesFromRemote);
    } catch (error) {
      // Handle error appropriately
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }
}
