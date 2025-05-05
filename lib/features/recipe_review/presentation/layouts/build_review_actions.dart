import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/app_icons.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/shared_layouts/app_icon_text.dart';

class BuildReviewActions extends StatelessWidget {
  const BuildReviewActions({
    super.key,
    required this.reviewRef,
    required this.favCount,
  });

  final dynamic reviewRef;
  final int favCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSpacing.lg,
      children: [
        AppIconText(
          onTap: () {
            //TODO: add fav comment
          },
          icon: AppIcons.favorite,
          label: favCount.toString(),
        ),
        AppIconText(
          onTap: () {
            //TODO: add reply
          },
          icon: AppIcons.reply,
          label: 'Reply',
        ),
      ],
    );
  }
}
