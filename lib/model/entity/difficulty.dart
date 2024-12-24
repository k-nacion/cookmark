enum Difficulty { easy, medium, hard }

extension DifficultyExtension on Difficulty {
  String toShortString() {
    return switch (name) {
      'EASY' => 'Easy',
      'MEDIUM' => 'Medium',
      'HARD' => 'Hard',
      _ => throw UnimplementedError(),
    };
  }

  static Difficulty mapDifficulty(String difficulty) => switch (difficulty.toLowerCase()) {
        'easy' => Difficulty.easy,
        'medium' => Difficulty.medium,
        'hard' => Difficulty.hard,
        _ => throw Exception('Invalid [difficulty] values coming from RecipeDTO.')
      };
}
