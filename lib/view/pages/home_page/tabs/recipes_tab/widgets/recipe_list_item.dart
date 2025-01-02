import 'package:cached_network_image/cached_network_image.dart';
import 'package:cook_mark/model/domain/entity/recipe.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Image.network(
            recipe.image,
            height: 120,
            width: 100,
            fit: BoxFit.cover,
          )*/
          CachedNetworkImage(
            imageUrl: recipe.image,
            placeholder: (context, url) => Center(child: CircularProgressIndicator.adaptive()),
            width: 100,
            height: 120,
          ),
          const Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text('${recipe.caloriesPerServings} Calories'),
                Gap(24),
              ],
            ),
          )
        ],
      ),
    );
  }
}
