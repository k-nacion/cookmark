import 'package:cook_mark/viewmodels/recipe_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeTab extends StatefulWidget {
  const RecipeTab({super.key});

  @override
  State<RecipeTab> createState() => _RecipeTabState();
}

class _RecipeTabState extends State<RecipeTab> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<RecipeViewmodel>().getAllRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<RecipeViewmodel>(
        builder: (context, value, child) {
          final recipes = value.recipes;

          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];

              return ListTile(
                title: Text(recipe.name),
              );
            },
          );
        },
      ),
    );
  }
}
