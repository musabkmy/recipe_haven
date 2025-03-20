import 'package:collection/collection.dart' show ListEquality;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/home/presentation/get_tonight_cook_cubit/get_tonight_cook_cubit.dart';
import 'package:recipe_haven/core/home/presentation/layouts/editors_choice_layouts/recipe_layout.dart';
import 'package:recipe_haven/core/shared_layouts/app_section_title.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildTonightCook extends StatefulWidget {
  const BuildTonightCook({super.key});

  @override
  State<BuildTonightCook> createState() => _BuildTonightCookState();
}

class _BuildTonightCookState extends State<BuildTonightCook> {
  late final PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTonightCookCubit, GetTonightCookState>(
      buildWhen:
          (previous, current) =>
              current is GetTonightCookSuccess &&
              previous is GetTonightCookSuccess &&
              !ListEquality().equals(previous.recipes, current.recipes),
      builder: (context, state) {
        if (state is GetTonightCookSuccess && state.recipes.isNotEmpty) {
          final recipes = state.recipes;
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: .35.sh, maxHeight: .5.sh),
            child: Column(
              spacing: AppSpacing.md,
              children: [
                AppSectionTitle('What to cook Tonight'),
                Expanded(
                  child: PageView(
                    controller: _controller,
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
                    controller: _controller,
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
