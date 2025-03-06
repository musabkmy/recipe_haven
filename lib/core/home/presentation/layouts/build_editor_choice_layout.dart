import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/home/presentation/layouts/editors_choice_layouts/editors_choice_layouts.dart';
import 'package:recipe_haven/core/shared_layouts/app_overlay.dart';
import 'package:recipe_haven/core/shared_layouts/shared_layouts.dart';
import 'package:recipe_haven/core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart';

class BuildEditorChoiceLayout extends StatelessWidget {
  const BuildEditorChoiceLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Logger logger = Logger('Editor\'s Choice');
    return BlocConsumer<GetRecipesCubit, GetRecipesState>(
      builder: (context, state) {
        if (state is GetRecipesSuccess) {
          // logger.info('state is: ${state.runtimeType}');
          // debugPrintStack();
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
                spacing: AppSpacing.xl,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  BuildBestCreators(),
                  BuildTodaysRecipe(),
                  BuildTonightCook(),
                  BuildTagsQuickLinks(),

                  SizedBox(),
                ],
              ),
            ),
          );
        }
        return SizedBox.shrink(); // Handle other states if needed
      },
      listener: (BuildContext context, GetRecipesState state) {
        if (state is GetRecipesLoading) {
          LoadingOverlay.show(context);
        } else {
          LoadingOverlay.hide(context);
        }
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
      height: imageHeight + (context.isTablet ? cardValue / 5 : cardValue / 6),
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
                        AppTextButton(label: 'Qienuhe'),
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
