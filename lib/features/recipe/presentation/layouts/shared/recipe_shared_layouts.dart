import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/constants/constants.dart';

class RecipeAppBarLeading extends StatelessWidget {
  const RecipeAppBarLeading({super.key, this.color = AppColors.background});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return context.router.canPop()
        ? GestureDetector(
          child: Container(
            height: 24.sp,
            width: 24.sp,
            alignment: Alignment.center,
            // margin: EdgeInsets.symmetric(horizontal: AppSpacing.md),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(color: AppColors.grey900, AppIcons.backArrow),
          ),
          onTap: () {
            context.router.pop();
          },
        )
        : SizedBox.shrink();
  }
}

IconThemeData recipeAppBarActionsTheme() =>
    IconThemeData(color: AppColors.grey900, size: 32);
List<Widget> recipeAppBarActions() {
  return [
    IconButton(icon: Icon(AppIcons.share), onPressed: () {}),
    IconButton(
      color: AppColors.grey900,
      icon: Icon(AppIcons.favorite),
      onPressed: () {},
    ),
    SizedBox(width: AppSpacing.md),
  ];
}

PreferredSizeWidget recipeAppBarBottom() => PreferredSize(
  preferredSize: Size.fromHeight(8.0),
  child: Container(color: AppColors.grey700, height: 1.0),
);
