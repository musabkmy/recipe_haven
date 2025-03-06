import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/context_extensions.dart';
import 'package:recipe_haven/constants/constants.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({super.key, this.title, required this.body, this.height});
  final String? title;
  final String body;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      insetPadding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
      child: Container(
        height: height ?? .7.sh,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
        ).copyWith(top: AppSpacing.lg),
        //       constraints: BoxConstraints(
        // minHeight: 0,
        // maxHeight: 300,
        //     ),
        child: SingleChildScrollView(
          child: Text.rich(
            TextSpan(
              text: title ?? '',
              style: context.displayMedium,
              children: [
                TextSpan(text: '\n\n$body', style: context.displaySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
