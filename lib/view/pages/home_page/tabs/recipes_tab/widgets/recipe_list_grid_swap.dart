import 'package:cook_mark/viewmodels/recipe_list_grid_provider.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class RecipeListGridSwap extends StatelessWidget {
  const RecipeListGridSwap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Consumer<RecipeListGridProvider>(
        builder: (context, value, child) {
          final isListView = value.isListView;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => value.toggleView(),
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedListView,
                  color: isListView ? Colors.black : Colors.grey,
                  size: 18,
                ),
              ),
              IconButton(
                onPressed: () => value.toggleView(),
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedGridView,
                  color: isListView ? Colors.grey : Colors.black,
                  size: 18,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
