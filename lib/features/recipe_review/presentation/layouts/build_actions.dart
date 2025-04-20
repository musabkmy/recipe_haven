import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/app_icons.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/shared_layouts/app_icon_text.dart';

class BuildActions extends StatelessWidget {
  const BuildActions({
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
        GestureDetector(
          onTap: () {
            //TODO: add fav comment
          },
          child: AppIconText(
            icon: AppIcons.favorite,
            label: favCount.toString(),
          ),
        ),
        GestureDetector(
          onTap: () {
            //TODO: add reply
          },
          child: AppIconText(icon: AppIcons.reply, label: 'Reply'),
        ),
      ],
    );
  }
}
