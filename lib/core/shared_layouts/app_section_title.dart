import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/context_extensions.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_button.dart';
import 'package:recipe_haven/config/extensions/object_extensions.dart';

class AppSectionTitle extends StatelessWidget {
  const AppSectionTitle(
    this.title, {
    super.key,
    this.onActionLabel,
    this.onActionPressed,
    this.withPadding = true,
  });
  final String title;
  final String? onActionLabel;
  final void Function()? onActionPressed;
  final bool withPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          withPadding
              ? EdgeInsetsDirectional.only(start: AppSpacing.minHorizontal)
              : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: context.headlineSmall),
          onActionLabel.letOrElse(
            (onActionLabel) =>
                AppTextButton(label: onActionLabel, onPressed: onActionPressed),
            orElse: () => SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
