import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/home/presentation/layouts/editors_choice_layouts/recipe_layout.dart';
import 'package:recipe_haven/core/shared_layouts/app_section_title.dart';
import 'package:recipe_haven/core/data/mocking_sources/mocking_sources.dart';

class BuildTodaysRecipe extends StatelessWidget {
  const BuildTodaysRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    final recipe = RecipeMockSource().getAllRecipes[4].toEntity();

    return Column(
      spacing: AppSpacing.md,
      children: [
        AppSectionTitle('Today\'s Recipe'),
        RecipeLayout(recipe: recipe),
      ],
    );
  }
}
