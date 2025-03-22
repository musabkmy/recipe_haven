import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/duration_extension.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/shared_layouts/app_info_highlight.dart';
import 'package:recipe_haven/core/shared_layouts/app_item_network_image.dart';
import 'package:recipe_haven/core/shared_layouts/app_network_circular_avatar.dart';

import 'package:recipe_haven/features/view_recipe/domain/entities/creator_entity.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/recipe_entity.dart';

class RecipeLayout extends StatelessWidget {
  const RecipeLayout({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final creator = recipe.creator;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),

      child: Column(
        spacing: AppSpacing.sl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(recipe),
          Text(recipe.title, style: context.bodyLarge),
          creator.letOrElse(
            (creator) => _buildCreator(creator, context),
            orElse: SizedBox.shrink,
          ),
        ],
      ),
    );
  }

  AppItemNetworkImage _buildImage(Recipe recipe) {
    return AppItemNetworkImage(
      width: double.maxFinite,
      imageUrl: recipe.imageUrl,
      stackChildren: [
        Positioned(
          top: 0,
          left: 0,
          child: AppInfoHighlight(
            withMargin: true,
            color: AppColors.lightAmberAccent,
            child: Text(
              recipe.selectedPortion.preparationTime.inTextDuration(),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildCreator(Creator creator, BuildContext context) {
    return Row(
      spacing: AppSpacing.sm,
      children: [
        AppNetworkCircularAvatar(
          imageUrl: creator.profilePic,
          name: creator.name,
          size: 28.sp,
          maxSize: 50,
        ),
        Expanded(
          child: Text(
            creator.name,
            style: context.bodySmallAction,
            maxLines: 2,
            // overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
