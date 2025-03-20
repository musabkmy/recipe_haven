import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_icons.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/cooking_step_entity.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/details/ingredient_entity.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/details/utensil_entity.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/details/weight_count_entity.dart';
import 'package:recipe_haven/features/view_recipe/presentation/blocs/recipe_info_bloc/recipe_info_bloc.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/shared/shared_layouts.dart';

class BuildCookingStep extends StatelessWidget {
  const BuildCookingStep({
    super.key,
    required this.valueKey,
    required this.initVisible,
    required this.stepNumber,
    required this.stepsCount,
  });

  // final CookingStep step;
  final int stepNumber;
  final int stepsCount;
  // final Map<String, String> ingredientsMap;
  // final Map<String, String> utensilsMap;
  final bool initVisible;
  final ValueKey valueKey;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isVisible = ValueNotifier<bool>(initVisible);

    // Logger('stepImages').info(stepImages.toString());
    return Column(
      key: valueKey,
      children: [
        _BuildIsVisibleTapLayout(isVisible, stepNumber, stepsCount),
        ValueListenableBuilder<bool>(
          valueListenable: isVisible,
          builder: (context, value, child) {
            return Visibility(
              visible: value,
              maintainState: true,
              maintainAnimation: true,
              child: Column(
                spacing: AppSpacing.sm,
                children: [
                  _BuildImages(stepNumber),
                  _BuildIngredients(stepNumber),
                  _BuildUtensils(stepNumber),
                  _BuildParagraph(stepNumber),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _BuildParagraph extends StatelessWidget {
  const _BuildParagraph(this.stepNumber);
  final int stepNumber;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      RecipeInfoBloc,
      RecipeInfoState,
      ({
        String? paragraph,
        Ingredients? ingredients,
        List<WeightCount>? ingredientsCount,
        Utensils? utensils,
      })
    >(
      selector:
          (state) => switch (state) {
            RecipeInfoSuccess(
              recipe: final recipe,
              selectedPortion: final selectedPortion,
            )
                when recipe.cookingStepsMap.containsKey(stepNumber) =>
              (
                paragraph: recipe.cookingStepsMap[stepNumber]!.paragraph,
                ingredients: recipe.details.baseIngredients,
                ingredientsCount: selectedPortion.ingredientsCount,
                utensils: recipe.utensils,
              ),
            _ => (
              paragraph: null,
              ingredients: null,
              ingredientsCount: null,
              utensils: null,
            ),
          },
      builder: (context, data) {
        if (data.ingredients == null ||
            data.ingredientsCount == null ||
            data.utensils == null) {
          return const SizedBox.shrink();
        }

        final utensilsMap = data.utensils!.nameMap;
        final ingredientsMap = {
          for (var element in data.ingredients!)
            if (data.ingredientsCount!.countIn(element.id) != 0)
              element.id:
                  '${data.ingredientsCount!.countIn(element.id).weightFormat} '
                  '${element.baseUnit?.abbreviation ?? ''} ${element.name}',
        };

        String formattedParagraph = data.paragraph ?? '';

        for (var entry in ingredientsMap.entries) {
          formattedParagraph = formattedParagraph.replaceAll(
            '${ParagraphKeys.ingredient.key}${entry.key}',
            '${entry.value} ',
          );
        }
        for (var entry in utensilsMap.entries) {
          formattedParagraph = formattedParagraph.replaceAll(
            '${ParagraphKeys.utensil.key}${entry.key}',
            '${entry.value} ',
          );
        }

        formattedParagraph = formattedParagraph
            .replaceAll(ParagraphKeys.timer.key, '')
            .replaceAll(ParagraphKeys.ln.key, '');

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
          child: SelectableText(
            formattedParagraph,
            style: context.bodyMedium,
            textAlign: TextAlign.justify,
          ),
        );
      },
    );
  }
}

class _BuildUtensils extends StatelessWidget {
  const _BuildUtensils(this.stepNumber);
  final int stepNumber;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      RecipeInfoBloc,
      RecipeInfoState,
      ({List<String>? utensilIDs, Utensils? utensils})
    >(
      selector:
          (state) => switch (state) {
            RecipeInfoSuccess(recipe: final recipe)
                when recipe.cookingStepsMap.containsKey(stepNumber) =>
              (
                utensilIDs: recipe.cookingStepsMap[stepNumber]!.utensilsID,
                utensils: recipe.utensils,
              ),
            _ => (utensilIDs: null, utensils: null),
          },
      builder: (context, data) {
        if (data.utensilIDs == null || data.utensils == null) {
          return const SizedBox.shrink();
        }

        final utensilsMap = data.utensils!.nameMap;
        final utensilNames = data.utensilIDs!
            .map((id) => utensilsMap[id] ?? '')
            .where((name) => name.isNotEmpty)
            .join(' - ');

        return BuildListTile(iconData: AppIcons.utensils, info: utensilNames);
      },
    );
  }
}

class _BuildIngredients extends StatelessWidget {
  const _BuildIngredients(this.stepNumber);
  final int stepNumber;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      RecipeInfoBloc,
      RecipeInfoState,
      ({
        List<String>? ingredientIDs,
        Ingredients? ingredients,
        List<WeightCount>? ingredientsCount,
      })
    >(
      selector:
          (state) => switch (state) {
            RecipeInfoSuccess(
              recipe: final recipe,
              selectedPortion: final selectedPortion,
            )
                when recipe.cookingStepsMap.containsKey(stepNumber) =>
              (
                ingredientIDs:
                    recipe.cookingStepsMap[stepNumber]!.ingredientsID,
                ingredients: recipe.details.baseIngredients,
                ingredientsCount: selectedPortion.ingredientsCount,
              ),
            _ => (
              ingredientIDs: null,
              ingredients: null,
              ingredientsCount: null,
            ),
          },
      builder: (context, data) {
        final ingredientIDs = data.ingredientIDs;
        final ingredients = data.ingredients;
        final ingredientsCount = data.ingredientsCount;

        if (ingredientIDs != null &&
            ingredients != null &&
            ingredientsCount != null) {
          final ingredientsMap = {
            for (var element in ingredients)
              if (ingredientsCount.countIn(element.id) != 0)
                element.id:
                    '${ingredientsCount.countIn(element.id).weightFormat} '
                    '${element.baseUnit?.abbreviation ?? ''} ${element.name}',
          };

          return BuildListTile(
            iconData: AppIcons.ingredients,
            info: ingredientIDs
                .map((id) => ingredientsMap[id] ?? '')
                .where((info) => info.isNotEmpty)
                .join(' - '),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _BuildIsVisibleTapLayout extends StatelessWidget {
  const _BuildIsVisibleTapLayout(
    this.isVisible,
    this.stepNumber,
    this.stepsCount,
  );

  final ValueNotifier<bool> isVisible;
  final int stepNumber;
  final int stepsCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isVisible.value = !isVisible.value,
      child: Container(
        height: 32.sp,
        width: double.maxFinite,
        color: AppColors.lightAmberAccent,
        margin: EdgeInsets.only(top: AppSpacing.xl),
        alignment: AlignmentDirectional.centerStart,
        constraints: BoxConstraints(minHeight: 52),
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
        child: Text(
          'Step $stepNumber/$stepsCount',
          style: context.displayMedium,
        ),
      ),
    );
  }
}

class _BuildImages extends StatelessWidget {
  const _BuildImages(this.stepNumber);
  final int stepNumber;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RecipeInfoBloc, RecipeInfoState, List<String>?>(
      selector:
          (state) => switch (state) {
            RecipeInfoSuccess(recipe: final recipe)
                when recipe.cookingStepsMap.containsKey(stepNumber) =>
              recipe.cookingStepsMap[stepNumber]!.imagesUrl,
            _ => null,
          },
      builder: (context, stepImages) {
        return (stepImages != null && stepImages.isNotEmpty)
            ? AppImageLayout(
              imageUrl: stepImages.first,
              height: .6.sw,
              width: double.maxFinite,
            )
            : const SizedBox.shrink();
      },
    );
  }
}
