import 'package:collection/collection.dart' show ListEquality;
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/duration_extension.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/config/routes/auto_route.gr.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart';
import 'package:recipe_haven/core/home/presentation/get_tags_cubit/get_tags_cubit.dart';
import 'package:recipe_haven/core/shared_layouts/app_icon_text.dart';
import 'package:recipe_haven/core/shared_layouts/app_info_highlight.dart';
import 'package:recipe_haven/core/shared_layouts/app_item_network_image.dart';
import 'package:recipe_haven/core/shared_layouts/app_network_circular_avatar.dart';
import 'package:recipe_haven/core/shared_layouts/app_section_title.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/entities.dart';

class BuildLatestRecipes extends StatelessWidget {
  const BuildLatestRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    // Logger logger = Logger('_buildLatestRecipes');
    // logger.info('state.recipes.length: ${state.recipes.length}');
    return BlocBuilder<GetRecipesCubit, GetRecipesState>(
      buildWhen:
          (previous, current) =>
              (current != previous) ||
              (current is GetRecipesSuccess &&
                  previous is GetRecipesSuccess &&
                  !ListEquality().equals(previous.recipes, current.recipes)),
      builder: (context, state) {
        if (state is GetRecipesSuccess) {
          final recipes = state.recipes;
          final length = recipes.length;
          return Column(
            spacing: AppSpacing.md,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSectionTitle('Our Latest Recipes', onActionLabel: 'See all'),
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: .3.sh, maxHeight: .4.sh),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  itemCount: length,
                  prototypeItem: _BuildItem(
                    ValueKey('prototypeItem'),
                    recipes[0],
                    length,
                  ),
                  itemBuilder: (context, index) {
                    return _BuildItem(
                      ValueKey(recipes[index].id),
                      recipes[index],
                      length,
                    );
                  },
                ),
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

class _BuildItem extends StatelessWidget {
  const _BuildItem(this.valueKey, this.recipe, this.length);

  final Recipe recipe;
  final int length;
  final ValueKey valueKey;

  // buildWhen:
  //           (previous, current) =>
  //               current is GetRecipesSuccess &&
  //               previous is GetRecipesSuccess &&
  //               previous.recipes.contains(recipe) !=
  //                   current.recipes.contains(recipe),
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: valueKey,
      onTap: () {
        context.router.push(RecipeInfoRoute(id: recipe.id, recipe: recipe));
      },
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm),
        child: SizedBox(
          width: .5.sw,
          child: Column(
            spacing: AppSpacing.sm,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BuildLatestRecipeImage(recipe),
              Text(recipe.title, style: context.bodySmall, maxLines: 2),
              _BuildRecipeCreatorName(recipe.creator),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildRecipeCreatorName extends StatelessWidget {
  const _BuildRecipeCreatorName(this.creator);
  final Creator? creator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .5.sw,
      child: Row(
        spacing: AppSpacing.sm,
        children: [
          AppNetworkCircularAvatar(
            imageUrl: creator?.profilePic,
            name: creator?.name,
            size: 28.sp,
            maxSize: 50,
          ),
          Expanded(
            child: Text(
              creator?.name ?? '',
              style: context.bodySmallAction,
              maxLines: 2,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildLatestRecipeImage extends StatelessWidget {
  const _BuildLatestRecipeImage(this.recipe);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return AppItemNetworkImage(
      imageUrl: recipe.imageUrl,
      stackChildren: [
        Positioned(
          top: 0,
          left: 0,
          child: AppInfoHighlight(
            withMargin: true,
            color: AppColors.lightAmberAccent,
            child: Text(recipe.selectedPortion.servingsCount),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: AppInfoHighlight(
            withMargin: true,
            color: AppColors.lightAmberAccent,
            child: Text(
              recipe.selectedPortion.preparationTime.inTextDuration(),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: AppInfoHighlight(
            withMargin: true,
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.sm,
              horizontal: AppSpacing.sl,
            ),
            child: AppIconText(
              icon: AppIcons.favorite,
              label: recipe.usersEngagement.likesCount.toString(),
            ),
          ),
        ),
      ],
    );
  }
}
