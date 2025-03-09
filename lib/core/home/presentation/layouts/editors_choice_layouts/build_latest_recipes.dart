import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/duration_extension.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/config/routes/auto_route.gr.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/shared_layouts/app_icon_text.dart';
import 'package:recipe_haven/core/shared_layouts/app_info_highlight.dart';
import 'package:recipe_haven/core/shared_layouts/app_item_network_image.dart';
import 'package:recipe_haven/core/shared_layouts/app_network_circular_avatar.dart';
import 'package:recipe_haven/core/shared_layouts/app_section_title.dart';

import 'package:recipe_haven/features/recipe/domain/entities/entities.dart';
import 'package:recipe_haven/core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart';

class BuildLatestRecipes extends StatelessWidget {
  const BuildLatestRecipes({
    super.key,
    required this.state,
    required this.recipes,
  });

  final GetRecipesSuccess state;
  final Recipes recipes;
  @override
  Widget build(BuildContext context) {
    // Logger logger = Logger('_buildLatestRecipes');
    // logger.info('state.recipes.length: ${state.recipes.length}');
    final length = state.recipes.length;
    return Column(
      spacing: AppSpacing.md,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionTitle('Our Latest Recipes', onActionLabel: 'See all'),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: .3.sh, maxHeight: .4.sh),
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Make it horizontal
            itemCount: length,
            itemBuilder: (context, index) {
              final item = recipes[index];
              final creator = item.creator;

              return GestureDetector(
                key: Key(item.id),
                onTap: () {
                  context.router.push(
                    RecipeInfoRoute(id: item.id, recipe: item),
                  );
                },

                child: Container(
                  margin: EdgeInsetsDirectional.only(
                    start:
                        index == 0 ? AppSpacing.minHorizontal : AppSpacing.sm,
                    end:
                        index == length - 1
                            ? AppSpacing.minHorizontal
                            : AppSpacing.sm,
                  ),
                  child: SizedBox(
                    width: .5.sw,
                    child: Column(
                      spacing: AppSpacing.sm,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLatestRecipeImage(item, context),
                        Text(item.title, style: context.bodySmall, maxLines: 2),
                        _buildRecipeCreatorName(creator, context),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  SizedBox _buildRecipeCreatorName(Creator? creator, BuildContext context) {
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
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  AppItemNetworkImage _buildLatestRecipeImage(
    Recipe item,
    BuildContext context,
  ) {
    return AppItemNetworkImage(
      imageUrl: item.imageUrl,
      stackChildren: [
        Positioned(
          top: 0,
          left: 0,
          child: AppInfoHighlight(
            withMargin: true,
            color: AppColors.lightAmberAccent,
            child: Text(item.selectedPortion.servingsCount),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: AppInfoHighlight(
            withMargin: true,
            color: AppColors.lightAmberAccent,
            child: Text(item.selectedPortion.preparationTime.inTextDuration()),
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
              label: item.usersEngagement.likesCount.toString(),
            ),
          ),
        ),
      ],
    );
  }
}
