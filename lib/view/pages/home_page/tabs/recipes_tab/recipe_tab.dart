import 'package:cook_mark/view/pages/home_page/tabs/recipes_tab/widgets/recipe_grid_view.dart';
import 'package:cook_mark/view/pages/home_page/tabs/recipes_tab/widgets/recipe_list.dart';
import 'package:cook_mark/view/pages/home_page/tabs/recipes_tab/widgets/recipe_list_grid_swap.dart';
import 'package:cook_mark/view/pages/home_page/tabs/recipes_tab/widgets/recipe_search_bar.dart';
import 'package:cook_mark/viewmodels/recipe_list_grid_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class RecipeTab extends StatelessWidget {
  const RecipeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: Column(
        children: [
          RecipeSearchBar(),
          const Gap(16),
          RecipeListGridSwap(),
          const Gap(16),
          Expanded(
            child: context.watch<RecipeListGridProvider>().isListView ? RecipeList() : RecipeGridView(),
          ),
        ],
      ),
    );
  }
}
