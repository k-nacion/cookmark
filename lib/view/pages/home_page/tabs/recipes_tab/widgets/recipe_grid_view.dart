import 'package:cook_mark/view/pages/home_page/tabs/recipes_tab/widgets/recipe_grid_item.dart';
import 'package:cook_mark/viewmodels/recipe_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeGridView extends StatelessWidget {
  const RecipeGridView({super.key});

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
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return RecipeGridItem(recipe: recipes[index]);
                },
                itemCount: recipes.length,
              );
      },
    );
  }
}
