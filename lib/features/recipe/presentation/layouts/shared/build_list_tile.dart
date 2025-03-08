import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_spacing.dart';

class BuildListTile extends StatelessWidget {
  const BuildListTile({super.key, required this.iconData, required this.info});
  final IconData iconData;
  final String info;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSpacing.minHorizontal,
      ),
      // .copyWith(top: AppSpacing.sm.sp),
      titleAlignment: ListTileTitleAlignment.titleHeight,
      leading: Padding(
        padding: EdgeInsetsDirectional.only(
          top: AppSpacing.xs,
          end: AppSpacing.xs,
        ),
        child: Icon(iconData, size: 16.sp, color: AppColors.grey900),
      ),
      title: Text(info, style: context.bodyMedium),
    );
  }
}
