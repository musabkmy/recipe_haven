import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_haven/constants/constants.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.secondary,
    this.textColor = AppColors.background,
    this.iconSvg,
    this.withBorderSide = false,
    required this.onPressed,
  });
  final bool withBorderSide;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final String? iconSvg;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: Size(double.maxFinite, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.xl),
          side:
              withBorderSide
                  ? BorderSide(color: AppColors.grey500)
                  : BorderSide.none,
        ),
        backgroundColor: backgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.sl),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconSvg != null
                ? Padding(
                  padding: EdgeInsetsDirectional.only(end: AppSpacing.sm),
                  child: SvgPicture.asset(iconSvg!, width: 20),
                )
                : SizedBox.shrink(),
            Text(
              title,
              style: AppTextStyles.buttonLabel.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
