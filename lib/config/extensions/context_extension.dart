import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_constants.dart';

extension ContextEx on BuildContext {
  double get deviceWidth => MediaQuery.of(this).size.width;
  double get deviceHeight => MediaQuery.of(this).size.height;
  bool get isTablet => deviceHeight >= AppConstants.smallTabletMaxHeight;
  bool get isMobile => deviceHeight < AppConstants.smallTabletMaxHeight;

  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;
  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;
  TextStyle get displayMediumAction =>
      displayMedium.copyWith(color: AppColors.lightOrange);
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  TextStyle get bodySmallAction =>
      bodySmall.copyWith(color: AppColors.deepOrange);
  TextStyle get bodySmallCancelAction =>
      bodySmall.copyWith(color: AppColors.grey700);
  TextStyle get caption => Theme.of(this).textTheme.labelSmall!;
}
