import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(body: _RecipeInfoBody());
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
          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [_buildTopImage(context, recipe, innerBoxIsScrolled)];
              },
              body: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: AppSpacing.xl),
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildTopInfos(recipe: recipe),
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
                ),
              ),
            ),
          );
        }
        return Center(child: Text('Failed Loading'));
      },
    );
  }

  SliverAppBar _buildTopImage(
    BuildContext context,
    Recipe recipe,
    bool innerBoxIsScrolled,
  ) {
    return SliverAppBar(
      expandedHeight: .6.sh,
      floating: false,
      pinned: true,
      forceElevated: true,
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.lightOverlayColor,
      surfaceTintColor: AppColors.background,
      toolbarHeight: 52,
      leadingWidth: 84,
      leading: GestureDetector(
        child: Container(
          height: 24.sp,
          width: 24.sp,
          alignment: Alignment.center,
          // margin: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.background,
            shape: BoxShape.circle,
          ),
          child: Icon(color: AppColors.grey900, AppIcons.backArrow),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      actionsIconTheme: IconThemeData(color: AppColors.grey900, size: 32),
      actions:
          innerBoxIsScrolled
              ? [
                IconButton(icon: Icon(AppIcons.share), onPressed: () {}),
                IconButton(
                  color: AppColors.grey900,
                  icon: Icon(AppIcons.favorite),
                  onPressed: () {},
                ),
                SizedBox(width: AppSpacing.md),
              ]
              : null,
      bottom:
          innerBoxIsScrolled
              ? PreferredSize(
                preferredSize: Size.fromHeight(8.0),
                child: Container(color: AppColors.grey700, height: 1.0),
              )
              : null,
      flexibleSpace: FlexibleSpaceBar(background: _buildRecipeImage(recipe)),
    );
  }

  Widget _buildRecipeImage(Recipe recipe) {
    return CachedNetworkImage(
      imageUrl: recipe.imageUrl,
      imageBuilder:
          (context, imageProvider) =>
              Image(fit: BoxFit.cover, image: imageProvider),
      progressIndicatorBuilder:
          (context, url, progress) => Center(
            child: CircularProgressIndicator(value: progress.progress),
          ),
    );
  }

  List<Widget> _buildCookingStepsMap({
    required CookingStepsMap steps,
    required PortionBasedRecipe selectedPortion,
    required Ingredients ingredients,
    required Utensils utensils,
  }) {
    //get ingredient quantity of selected portion
    //key: id, value: quantity + ingredient name + abbreviation 'if any'
    Map<String, String> ingredientsMap = <String, String>{};
    for (var element in ingredients) {
      final count = selectedPortion.ingredientsCount.countIn(element.id);
      if (count != 0) {
        ingredientsMap.putIfAbsent(
          element.id,
          () =>
              '${count.weightFormat}${element.baseUnit?.abbreviation ?? ''} ${element.name}',
        );
      }
    }

    //key: id, value: utensil name
    Map<String, String> utensilsMap = <String, String>{};
    for (var element in utensils) {
      utensilsMap.putIfAbsent(element.id, () => element.name);
    }
    // Logger('utensils map').info(utensils.toString());
    List<Widget> stepsWidgets = <Widget>[];
    int stepNumber;
    int stepsLength = steps.length;

    for (stepNumber = 1; stepNumber <= stepsLength; stepNumber++) {
      bool hasStep = steps.containsKey(stepNumber);
      if (hasStep) {
        stepsWidgets.add(
          BuildCookingStep(
            initVisible: stepNumber == 1,
            step: steps[stepNumber]!,
            stepNumber: stepNumber,
            stepsCount: stepsLength,
            ingredientsMap: ingredientsMap,
            utensilsMap: utensilsMap,
          ),
        );
      }
    }
    return stepsWidgets;
  }
}
