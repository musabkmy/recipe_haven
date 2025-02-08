import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/constants.dart';

final class AppTheme {
  static ThemeData get light {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.xs),
      borderSide: BorderSide.none,
    );
    final textTheme = TextTheme(
      headlineLarge: TextStyles.headingLarge,
      headlineMedium: TextStyles.headingMedium,
      headlineSmall: TextStyles.headingSmall,
      bodyLarge: TextStyles.bodyLarge,
      bodyMedium: TextStyles.bodyMedium,
      bodySmall: TextStyles.bodySmall,
      labelLarge: TextStyles.buttonLabel,
      labelSmall: TextStyles.caption,
    );
    return ThemeData(
      primarySwatch: AppColors.primary,
      textTheme: textTheme,
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.background,
        border: inputBorder,
        errorBorder: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        disabledBorder: inputBorder,
      ),
    );
  }

  const AppTheme._();
}
