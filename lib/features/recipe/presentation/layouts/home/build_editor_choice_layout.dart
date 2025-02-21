import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/app_info_highlight.dart';
import 'package:recipe_haven/features/recipe/presentation/get_recipes_cubit/get_recipes_cubit.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/home/build_latest_recipes.dart';

class BuildEditorChoiceLayout extends StatelessWidget {
  const BuildEditorChoiceLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Logger logger = Logger('Editor\'s Choice');
    return BlocBuilder<GetRecipesCubit, GetRecipesState>(
      builder: (context, state) {
        if (state is GetRecipesSuccess) {
          final recipes = state.recipes;
          final mainDishImageHeight = .6.sh;
          final maxMainDishCardPosition = .45.sh;
          final minMainDishCardPosition = context.isTablet ? .27.sh : .35.sh;
          final ValueNotifier<double> mainDishCardPosition = ValueNotifier(
            maxMainDishCardPosition,
          );

          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                if (mainDishCardPosition.value != minMainDishCardPosition ||
                    notification.metrics.pixels == 0) {
                  mainDishCardPosition.value =
                      maxMainDishCardPosition - notification.metrics.pixels;
                  mainDishCardPosition.value = mainDishCardPosition.value.clamp(
                    minMainDishCardPosition,
                    maxMainDishCardPosition,
                  );
                }
              }
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Wrap only _buildTop with ValueListenableBuilder
                  // to not building unnecessary widgets
                  ValueListenableBuilder<double>(
                    valueListenable: mainDishCardPosition,
                    builder: (context, cardValue, child) {
                      return _buildTop(
                        context,
                        mainDishImageHeight,
                        maxMainDishCardPosition,
                        cardValue,
                      );
                    },
                  ),
                  BuildLatestRecipes(state: state, recipes: recipes),
                ],
              ),
            ),
          );
        }
        return SizedBox.shrink(); // Handle other states if needed
      },
    );
  }

  Widget _buildTop(
    BuildContext context,
    double imageHeight,
    double maxMainDishCardPosition,
    double cardValue,
  ) {
    return SizedBox(
      height: imageHeight + (context.isTablet ? cardValue / 3 : cardValue / 4),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/home_main_dish.jpg',
            height: imageHeight,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: Positioned(
              top: cardValue,
              left: 0,
              right: 0,
              // height: .25.sh,
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                padding: EdgeInsets.all(AppSpacing.md).r,
                decoration: BoxDecoration(
                  color: AppColors.lightAmberAccent,
                  borderRadius: AppStyles.borderRadiusML,
                ),
                child: Column(
                  spacing: AppSpacing.lg,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Oven Fresh and Cozy\n',
                        style: context.bodySmall.copyWith(height: 2),
                        children: [
                          TextSpan(
                            text:
                                'One-Pan Coconut Curry Salmon with Garlic Butter',
                            style: context.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: null,
                          child: Text(
                            'Qienuhe',
                            style: context.bodySmallAction,
                          ),
                        ),
                        GestureDetector(
                          child: AppInfoHighlight(
                            child: Text.rich(
                              TextSpan(
                                text: '♡ ',
                                style: context.bodyLarge,
                                children: [
                                  TextSpan(
                                    text: '1.64k',
                                    style: context.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
