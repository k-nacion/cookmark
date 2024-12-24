import 'dart:collection';

import 'package:cook_mark/model/dto/recipe_dto.dart';
import 'package:cook_mark/model/entity/difficulty.dart';
import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final int id;
  final String name;
  final UnmodifiableSetView<String> ingredients;
  final UnmodifiableListView<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final Difficulty difficulty;
  final UnmodifiableSetView<String> tags;
  final String cuisine;
  final int caloriesPerServings;
  final String image;
  final double rating;
  final int reviewCount;
  final UnmodifiableSetView<String> mealType;
  final int userId;

  const Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.tags,
    required this.cuisine,
    required this.caloriesPerServings,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
    required this.userId,
  });

  factory Recipe.fromDTO(RecipeDTO dto) {
    return Recipe(
      id: dto.id,
      name: dto.name,
      ingredients: UnmodifiableSetView(dto.ingredients.toSet()),
      instructions: UnmodifiableListView(dto.instructions),
      prepTimeMinutes: dto.prepTimeMinutes,
      cookTimeMinutes: dto.cookTimeMinutes,
      servings: dto.servings,
      difficulty: DifficultyExtension.mapDifficulty(dto.difficulty),
      tags: UnmodifiableSetView(dto.tags.toSet()),
      cuisine: dto.cuisine,
      caloriesPerServings: dto.caloriesPerServing,
      image: dto.image,
      rating: dto.rating,
      reviewCount: dto.reviewCount,
      mealType: UnmodifiableSetView(dto.mealType.toSet()),
      userId: dto.userId,
    );
  }

  RecipeDTO toDTO() {
    return RecipeDTO(
      id: id,
      name: name,
      ingredients: ingredients.toList(),
      instructions: instructions,
      prepTimeMinutes: prepTimeMinutes,
      cookTimeMinutes: cookTimeMinutes,
      servings: servings,
      difficulty: difficulty.toShortString(),
      cuisine: cuisine,
      caloriesPerServing: caloriesPerServings,
      tags: tags.toList(),
      userId: userId,
      image: image,
      rating: rating,
      reviewCount: reviewCount,
      mealType: mealType.toList(),
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        ingredients,
        instructions,
        prepTimeMinutes,
        cookTimeMinutes,
        servings,
        difficulty,
        tags,
        cuisine,
        caloriesPerServings,
        image,
        rating,
        reviewCount,
        userId,
        mealType,
      ];
}
