import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/home/presentation/get_tonight_cook_cubit/get_tonight_cook_cubit.dart';
import 'package:recipe_haven/core/home/presentation/layouts/editors_choice_layouts/recipe_layout.dart';
import 'package:recipe_haven/core/shared_layouts/app_section_title.dart';
import 'package:recipe_haven/core/shared_layouts/shared_layouts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildTonightCook extends StatelessWidget {
  const BuildTonightCook({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return BlocBuilder<GetTonightCookCubit, GetTonightCookState>(
      builder: (context, state) {
        if (state is GetTonightCookSuccess && state.recipes.isNotEmpty) {
          final recipes = state.recipes;
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: .35.sh, maxHeight: .47.sh),
            child: Column(
              spacing: AppSpacing.md,
              children: [
                AppSectionTitle('What to cook Tonight'),
                Expanded(
                  child: PageView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    children:
                        recipes
                            .map((item) => RecipeLayout(recipe: item))
                            .toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.minHorizontal,
                  ),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: recipes.length,
                    effect: WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      dotColor: AppColors.grey400,
                      activeDotColor: AppColors.lightOrange,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
