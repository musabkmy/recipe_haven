import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/constants/app_colors.dart';

class BuildCircularButton extends StatelessWidget {
  const BuildCircularButton({
    super.key,
    required this.iconData,
    required this.label,
    this.onTap,
  });
  final IconData iconData;
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              height: 48.sp,
              width: 48.sp,
              constraints: BoxConstraints(
                maxHeight: 52,
                maxWidth: 52,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.transparent,
                border: Border.all(color: AppColors.grey300),
              ),
              child: Icon(iconData, color: AppColors.grey700)),
          Text(label, style: context.bodyMedium),
        ],
      ),
    );
  }
}
