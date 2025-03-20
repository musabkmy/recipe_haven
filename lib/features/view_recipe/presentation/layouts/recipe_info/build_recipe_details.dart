import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/extensions/duration_extension.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/app_spacer.dart';

import 'package:recipe_haven/features/view_recipe/domain/entities/details/entities_details.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/shared/shared_layouts.dart';
import 'package:recipe_haven/features/view_recipe/presentation/blocs/recipe_info_bloc/recipe_info_bloc.dart';

// ignore: must_be_immutable
class BuildRecipeDetails extends StatelessWidget {
  const BuildRecipeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger('BuildRecipeDetails');

    return BlocSelector<
      RecipeInfoBloc,
      RecipeInfoState,
      (Details?, PortionBasedRecipe?, bool, bool)
    >(
      selector: (state) {
        if (state is RecipeInfoSuccess) {
          return (
            state.recipe.details,
            state.selectedPortion,
            state.hasPrevious,
            state.hasNext,
          );
        }
        return (null, null, false, false);
      },
      builder: (context, data) {
        final recipeDetails = data.$1;
        final selectedPortion = data.$2;
        logger.info('selectedPortion ${selectedPortion.toString()}  ');
        if (recipeDetails != null && selectedPortion != null) {
          final hasPrevious = data.$3;
          final hasNext = data.$4;
          return _BuildRecipeDetailsView(
            recipeDetails,
            selectedPortion,
            hasPrevious,
            hasNext,
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

class _BuildRecipeDetailsView extends StatelessWidget {
  const _BuildRecipeDetailsView(
    this.recipeDetails,
    this.selectedPortion,
    this.hasPrevious,
    this.hasNext,
  );
  final Details recipeDetails;
  final PortionBasedRecipe selectedPortion;
  final bool hasPrevious;
  final bool hasNext;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
          child: _buildDifficulty(context),
        ),
        AppSpacer(),
        _buildIngredients(context),
        AppSpacer(height: 100),
        //preparation/baking/resting
        _buildTiming(),
        AppSpacer(height: 70),
        //nutrition
        _buildNutritious(context),
      ],
    );
  }

  Widget _buildIngredients(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
      child: Column(
        spacing: AppSpacing.xl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ingredients', style: context.displayLarge),
          _buildChangeSelectedPortion(context),
          _buildIngredientsList(context),
        ],
      ),
    );
  }

  Widget _buildIngredientsList(BuildContext context) {
    return Row(
      spacing: AppSpacing.x4l,
      children: [
        Column(
          spacing: AppSpacing.xs,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              recipeDetails.baseIngredients.map((element) {
                final count = selectedPortion.ingredientsCount.countIn(
                  element.id,
                );
                return count == 0
                    ? SizedBox.shrink()
                    : Text(
                      '${count.weightFormat} ${element.baseUnit?.abbreviation ?? ''}',
                      style: context.bodyMedium,
                    );
              }).toList(),
        ),
        Column(
          spacing: AppSpacing.xs,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              recipeDetails.baseIngredients.map((element) {
                final count = selectedPortion.ingredientsCount.countIn(
                  element.id,
                );
                return count == 0
                    ? SizedBox.shrink()
                    : Text(element.name, style: context.bodyMedium);
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildChangeSelectedPortion(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${selectedPortion.servingsCount} Servings',
          style: context.displayMedium,
        ),
        Row(
          spacing: AppSpacing.md.sp,
          children: [
            BuildChangeButton(
              onPressed:
                  hasPrevious
                      ? () {
                        context.read<RecipeInfoBloc>().add(
                          ChangeSelectedPortion(next: false),
                        );
                      }
                      : null,
              child: Icon(AppIcons.backArrow, size: min(16.sp, 24)),
            ),
            Container(
              width: min(38.sp, 58),
              alignment: Alignment.center,
              child: Text(selectedPortion.servingsCount),
            ),
            BuildChangeButton(
              onPressed:
                  hasNext
                      ? () {
                        context.read<RecipeInfoBloc>().add(
                          ChangeSelectedPortion(next: true),
                        );
                      }
                      : null,
              child: Icon(AppIcons.forwardArrow, size: min(16.sp, 24)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNutritious(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
      width: double.maxFinite,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text('Nutrition per serving', style: context.displayLarge),
          ),
          SizedBox(height: AppSpacing.md.sp, width: double.infinity),
          ...recipeDetails.baseNutritious.map((element) {
            return Column(
              children: [
                Text(
                  '${element.name}\n${selectedPortion.nutritiousCount.countIn(element.id)} ${element.baseUnit?.abbreviation ?? ''}',
                  style: context.bodyMedium,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTiming() {
    return Row(
      spacing: AppSpacing.xxl.sp,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        selectedPortion.preparationTime == Duration.zero
            ? SizedBox.shrink()
            : BuildCircularProgress(
              progress: selectedPortion.preparationTime.inDurationPercentage(),
              text: 'Preparation',
              durationText: selectedPortion.preparationTime.inTextDuration(),
            ),
        selectedPortion.bakingTime == Duration.zero
            ? SizedBox.shrink()
            : BuildCircularProgress(
              progress: selectedPortion.bakingTime.inDurationPercentage(),
              text: 'Baking',
              durationText: selectedPortion.bakingTime.inTextDuration(),
            ),
        selectedPortion.restingTime == Duration.zero
            ? SizedBox.shrink()
            : BuildCircularProgress(
              progress: selectedPortion.restingTime.inDurationPercentage(),
              text: 'Resting',
              durationText: selectedPortion.restingTime.inTextDuration(),
            ),
      ],
    );
  }

  Widget _buildDifficulty(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Difficulty: ',
        style: context.displayLarge,
        children: [
          TextSpan(
            text: '${selectedPortion.difficulty.name} ',
            style: context.bodyLarge,
          ),
          TextSpan(
            text: selectedPortion.difficultyEmoji,
            style: context.bodyLarge,
          ),
        ],
      ),
    );
  }
}
