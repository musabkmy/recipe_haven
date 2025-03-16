import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/config/extensions/string_extension.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/recipe_entity.dart';

class BuildUtensils extends StatelessWidget {
  const BuildUtensils({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
      child: Column(
        spacing: AppSpacing.sm,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Utensils', style: context.displayLarge),
          Text(
            recipe.utensils
                .map((element) => element.name.capitalizeEachWord)
                .toList()
                .join(', '),
            style: context.bodyMedium,
          ),
        ],
      ),
    );
  }
}
