import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/features/view_recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/recipe_info/cooking_steps/build_cooking_step.dart';

class BuildCookingSteps extends StatelessWidget {
  const BuildCookingSteps({super.key});

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger('name: BuildCookingSteps');
    return BlocSelector<RecipeInfoBloc, RecipeInfoState, Iterable<int>?>(
      selector:
          (state) => switch (state) {
            RecipeInfoSuccess(recipe: final recipe) =>
              // when recipe.cookingStepsMap.isNotEmpty =>
              recipe.cookingStepsMap.keys,
            _ => null,
          },
      builder: (context, keys) {
        return (keys != null && keys.isNotEmpty)
            ? CustomScrollView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final stepNumber = keys.elementAt(index);
                    logger.info('building $stepNumber');
                    return BuildCookingStep(
                      valueKey: ValueKey('$stepNumber'),
                      initVisible: stepNumber == 1,
                      stepNumber: stepNumber,
                      stepsCount: keys.length,
                    );
                  }, childCount: keys.length),
                ),
              ],
            )
            : const SizedBox.shrink();
      },
    );
  }
}
