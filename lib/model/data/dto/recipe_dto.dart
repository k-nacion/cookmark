import 'package:equatable/equatable.dart';

class RecipeDTO extends Equatable {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final int userId;
  final String image;
  final num rating;
  final int reviewCount;
  final List<String> mealType;

  const RecipeDTO({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        ingredients,
        instructions,
        prepTimeMinutes,
        cookTimeMinutes,
        servings,
        difficulty,
        cuisine,
        caloriesPerServing,
        tags,
        userId,
        image,
        rating,
        reviewCount,
        mealType
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'servings': servings,
      'difficulty': difficulty,
      'cuisine': cuisine,
      'caloriesPerServing': caloriesPerServing,
      'tags': tags,
      'userId': userId,
      'image': image,
      'rating': rating,
      'reviewCount': reviewCount,
      'mealType': mealType,
    };
  }

  factory RecipeDTO.fromMap(Map<String, dynamic> map) {
    return RecipeDTO(
      id: map['id'] as int,
      name: map['name'] as String,
      ingredients: (map['ingredients'] as List<dynamic>).cast<String>(),
      instructions: (map['instructions'] as List<dynamic>).cast<String>(),
      prepTimeMinutes: map['prepTimeMinutes'] as int,
      cookTimeMinutes: map['cookTimeMinutes'] as int,
      servings: map['servings'] as int,
      difficulty: map['difficulty'] as String,
      cuisine: map['cuisine'] as String,
      caloriesPerServing: map['caloriesPerServing'] as int,
      tags: (map['tags'] as List<dynamic>).cast<String>(),
      userId: map['userId'] as int,
      image: map['image'] as String,
      rating: map['rating'] as num,
      reviewCount: map['reviewCount'] as int,
      mealType: (map['mealType'] as List<dynamic>).cast<String>(),
    );
  }
}
