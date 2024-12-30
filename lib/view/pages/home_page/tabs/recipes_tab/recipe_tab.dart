import 'package:cook_mark/view/pages/home_page/tabs/recipes_tab/widgets/recipe_list.dart';
import 'package:cook_mark/view/pages/home_page/tabs/recipes_tab/widgets/recipe_search_bar.dart';
import 'package:flutter/material.dart';

class RecipeTab extends StatelessWidget {
  const RecipeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          RecipeList(),
          RecipeSearchBar(),
        ],
      ),
    );
  }
}
