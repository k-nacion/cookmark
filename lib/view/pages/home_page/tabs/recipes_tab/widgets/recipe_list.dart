import 'package:cook_mark/viewmodels/recipe_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({
    super.key,
  });

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeViewmodel>(
      builder: (context, value, child) {
        final recipes = value.recipes;
        final isFetching = value.isFetching;

        return isFetching
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];

                  return ListTile(
                    title: Text(recipe.name),
                  );
                },
              );
      },
    );
  }
}
