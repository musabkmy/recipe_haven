import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/constants.dart';

class AppLoadingLayout extends StatelessWidget {
  const AppLoadingLayout({super.key, this.value, this.color});
  final double? value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? AppColors.lightOrange,
      value: value,
      constraints: BoxConstraints.tight(Size(24, 24)),
    );
  }
}
