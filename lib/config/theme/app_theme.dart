import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/constants/constants.dart';

final class AppTheme {
  static ThemeData get light {
    final inputBorder = OutlineInputBorder(
      borderRadius: AppStyles.borderRadiusXS,
      borderSide: BorderSide.none,
    );
    final textTheme = TextTheme(
      headlineLarge: AppTextStyles.headingLarge,
      headlineMedium: AppTextStyles.headingMedium,
      headlineSmall: AppTextStyles.headingSmall,
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.buttonLabel,
      labelSmall: AppTextStyles.caption,
    );
    final appBarTheme = AppBarTheme(
      // color: AppColors.background,
      backgroundColor: AppColors.background,
      // foregroundColor:,
      elevation: 0,
      // scrolledUnderElevation:,
      // shadowColor:,
      // surfaceTintColor:,
      // shape:,
      // iconTheme:,
      // actionsIconTheme:,
      // centerTitle:,
      //   titleSpacing:,
      toolbarHeight: 24.sp,
      // toolbarTextStyle:,
      // titleTextStyle:,
      // systemOverlayStyle:,
      // actionsPadding:,
    );

    final tabBarTheme = TabBarTheme(
      // indicatorColor: AppColors.lightOrange,
      overlayColor: WidgetStateProperty.all(AppColors.transparent),
      labelColor: AppColors.deepOrange,
      labelStyle: AppTextStyles.bodySmall,
      unselectedLabelStyle: AppTextStyles.bodySmall,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.deepOrange, width: 1.0),
      ),
    );

    final bottomNavigationBarThemeData = BottomNavigationBarThemeData(
      backgroundColor: AppColors.grey100,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 32),
      unselectedIconTheme: IconThemeData(size: 32),
      selectedItemColor: AppColors.orange,
      selectedLabelStyle: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
      unselectedItemColor: AppColors.grey500,
      unselectedLabelStyle: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
    );
    return ThemeData(
      primarySwatch: AppColors.primary,
      textTheme: textTheme,
      scaffoldBackgroundColor: AppColors.background,
      splashColor: AppColors.transparent, // Change splash color
      highlightColor: AppColors.transparent,
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(borderRadius: AppStyles.borderRadiusM),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.background,
        border: inputBorder,
        errorBorder: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        disabledBorder: inputBorder,
      ),
      appBarTheme: appBarTheme,
      tabBarTheme: tabBarTheme,
      bottomNavigationBarTheme: bottomNavigationBarThemeData,
    );
  }

  const AppTheme._();
}
