import 'package:cached_network_image/cached_network_image.dart';
import 'package:cook_mark/model/domain/entity/recipe.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecipeGridItem extends StatelessWidget {
  const RecipeGridItem({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CachedNetworkImage(imageUrl: recipe.image),
          Gap(8),
          Text(
            recipe.name,
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text('${recipe.caloriesPerServings} Calories'),
        ],
      ),
    );
  }
}
