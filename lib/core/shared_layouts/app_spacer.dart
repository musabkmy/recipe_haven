import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/app_colors.dart';

class AppSpacer extends StatelessWidget {
  const AppSpacer({
    super.key,
    this.height = 50,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height, child: Divider(thickness: 1, color: AppColors.grey400));
  }
}
