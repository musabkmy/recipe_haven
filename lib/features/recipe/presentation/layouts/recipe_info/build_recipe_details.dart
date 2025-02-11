import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/duration_extensions.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/shared_layouts.dart';
import 'package:recipe_haven/features/recipe/domain/entities/details/entities_details.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/shared/build_circular_progress.dart';

// ignore: must_be_immutable
class BuildRecipeDetails extends StatelessWidget {
  BuildRecipeDetails({
    super.key,
    required this.recipeDetails,
  }) : selectedPortion = recipeDetails.selectedPortion;

  final Details recipeDetails;
  late PortionBasedRecipe selectedPortion;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.minHorizontal,
          ),
          child: _buildDifficulty(context),
        ),
        AppSpacer(height: 100),
        //preparation/baking/resting
        _buildTiming(),
        AppSpacer(height: 70),
        _buildIngredients(context),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients',
            style: context.displayLarge,
          ),
          SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${recipeDetails.selectedPortion.servingsCount} Servings',
                style: context.displayMedium,
              ),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      height: 24.sp,
                      width: 32.sp,
                      color: AppColors.lightOrangeAccent,
                      child: Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
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
              child:
                  Text('Nutrition per serving', style: context.displayLarge)),
          SizedBox(height: AppSpacing.md.sp, width: double.infinity),
          ...recipeDetails.baseNutritious.map((element) {
            return Column(
              children: [
                Text(
                    '${element.name}\n${selectedPortion.nutritiousCount.countIn(element.id)} ${element.baseUnit?.abbreviation ?? ''}',
                    style: context.bodyMedium),
              ],
            );
          }),
          AppSpacer(),
        ],
      ),
    );
  }

  Widget _buildTiming() {
    final selectedPortion = recipeDetails.selectedPortion;
    return Row(
      spacing: AppSpacing.xxl.sp,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        selectedPortion.preparationTime == Duration.zero
            ? SizedBox.shrink()
            : BuildCircularProgress(
                progress: selectedPortion.preparationTime.durationPercentage(),
                text: 'Preparation',
                durationText: selectedPortion.preparationTime.toTextDuration(),
              ),
        selectedPortion.bakingTime == Duration.zero
            ? SizedBox.shrink()
            : BuildCircularProgress(
                progress: selectedPortion.bakingTime.durationPercentage(),
                text: 'Baking',
                durationText: selectedPortion.bakingTime.toTextDuration(),
              ),
        selectedPortion.restingTime == Duration.zero
            ? SizedBox.shrink()
            : BuildCircularProgress(
                progress: selectedPortion.restingTime.durationPercentage(),
                text: 'Resting',
                durationText: selectedPortion.restingTime.toTextDuration(),
              ),
      ],
    );
  }

  Widget _buildDifficulty(BuildContext context) {
    return Text.rich(
        TextSpan(text: 'Difficulty: ', style: context.displayLarge, children: [
      TextSpan(
          text: '${recipeDetails.selectedPortion.difficulty.name} ',
          style: context.bodyLarge),
      TextSpan(
          text: recipeDetails.selectedPortion.difficultyEmoji,
          style: context.bodyLarge),
    ]));
  }
}
