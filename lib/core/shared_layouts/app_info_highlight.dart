import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/constants.dart';

class AppInfoHighlight extends StatelessWidget {
  const AppInfoHighlight({
    super.key,
    required this.child,
    this.color = AppColors.background,
    this.withMargin = false,
    this.padding,
    this.borderRadius,
  });
  final Widget child;
  final Color color;
  final bool withMargin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? AppStyles.borderRadiusML,
      ),
      margin: withMargin ? EdgeInsets.all(AppSpacing.sm) : EdgeInsets.zero,
      padding:
          padding ??
          EdgeInsets.symmetric(
            vertical: AppSpacing.xs,
            horizontal: AppSpacing.sl,
          ),
      child: child,
    );
  }
}
