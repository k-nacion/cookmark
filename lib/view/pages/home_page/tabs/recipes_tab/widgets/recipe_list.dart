import 'package:cook_mark/view/pages/home_page/tabs/recipes_tab/widgets/recipe_list_item.dart';
import 'package:cook_mark/viewmodels/recipe_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({
    super.key,
  });

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
                padding: const EdgeInsets.only(
                  // top: 72,
                  left: 16,
                  right: 16,
                ),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];

                  return RecipeListItem(recipe: recipe);
                },
              );
      },
    );
  }
}
