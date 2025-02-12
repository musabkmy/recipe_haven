import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_haven/config/extensions/numbers_extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/shared_layouts.dart';
import 'package:recipe_haven/features/recipe/domain/entities/entities.dart';
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
    return BlocBuilder<RecipeInfoBloc, RecipeInfoState>(
        builder: (context, state) {
      if (state is RecipeInfoSuccess) {
        final recipe = state.recipe;
        final selectedPortion = state.selectedPortion;
        final hasPrevious = state.hasPrevious;
        final hasNext = state.hasNext;
        // Logger('on _RecipeInfoBody, selectedPortion:')
        //     .info(selectedPortion.servingsCount);
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
                BuildRecipeDetails(
                  recipeDetails: recipe.details,
                  selectedPortion: selectedPortion,
                  hasPrevious: hasPrevious,
                  hasNext: hasNext,
                ),
                AppSpacer(height: 100),
                //utensils
                BuildUtensils(recipe: recipe),
                ..._buildCookingStepsMap(
                  steps: recipe.cookingStepsMap,
                  selectedPortion: selectedPortion,
                  ingredients: recipe.details.baseIngredients,
                  utensils: recipe.utensils,
                ),
              ],
            ));
      } else {
        return Center(
          child: Text('Failed Loading'),
        );
      }
    });
  }

  List<Widget> _buildCookingStepsMap(
      {required CookingStepsMap steps,
      required PortionBasedRecipe selectedPortion,
      required Ingredients ingredients,
      required Utensils utensils}) {
    //get ingredient quantity of selected portion
    //key: id, value: quantity + ingredient name + abbreviation 'if any'
    Map<String, String> ingredientsMap = <String, String>{};
    for (var element in ingredients) {
      final count = selectedPortion.ingredientsCount.countIn(element.id);
      if (count != 0) {
        ingredientsMap.putIfAbsent(
            element.id,
            () =>
                '${count.weightFormat} ${element.baseUnit?.abbreviation ?? ''}');
      }
    }

    //key: id, value: utensil name
    Map<String, String> utensilsMap = <String, String>{};
    utensils.map(
        (element) => utensilsMap.putIfAbsent(element.id, () => element.name));

    List<Widget> stepsWidgets = <Widget>[];
    int stepNumber;
    int stepsLength = steps.length;

    for (stepNumber = 1; stepNumber <= stepsLength; stepNumber++) {
      bool hasStep = steps.containsKey(stepNumber);
      if (hasStep) {
        stepsWidgets.add(BuildCookingStep(
            step: steps[stepNumber]!,
            stepNumber: stepNumber,
            stepsCount: stepsLength,
            ingredientsMap: ingredientsMap,
            utensilsMap: utensilsMap));
      }
    }
    return stepsWidgets;
  }
}
