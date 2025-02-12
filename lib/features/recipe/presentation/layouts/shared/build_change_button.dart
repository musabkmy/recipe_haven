import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/constants.dart';

class BuildChangeButton extends StatelessWidget {
  const BuildChangeButton({
    super.key,
    this.onPressed,
    required this.child,
  });
  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.minPositive,
      padding: EdgeInsets.zero,
      elevation: 0,
      disabledColor: AppColors.grey300,
      color: AppColors.lightAmberAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Apply border radius
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: max(AppSpacing.sm.sp, AppSpacing.md),
            vertical: max(8, AppSpacing.xs.sp)),
        child: child,
      ),
    );
  }
}
