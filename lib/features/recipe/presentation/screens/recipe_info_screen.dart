import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/shared_layouts.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/recipe_info/recipe_info_layouts.dart';
import 'package:recipe_haven/features/recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart';

class RecipeInfoScreen extends StatelessWidget {
  const RecipeInfoScreen({super.key});
  static const id = 'RecipesInfoScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _RecipeInfoBody(),
    );
  }
}

class _RecipeInfoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeInfoBloc, RecipeInfoState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RecipeInfoSuccess) {
            final recipe = state.recipe;
            return SingleChildScrollView(
                padding: EdgeInsets.only(bottom: AppSpacing.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildTop(recipe: recipe),
                    AppSpacer(height: 70),
                    BuildCreator(creator: recipe.creator),
                    BuildDescription(recipe: recipe),
                    BuildToReviews(reviews: recipe.reviews),
                    AppSpacer(height: 100),
                    BuildRecipeDetails(recipeDetails: recipe.details),
                  ],
                ));
          } else {
            return Center(
              child: Text('Failed Loading'),
            );
          }
        });
  }
}
