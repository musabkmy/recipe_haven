import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/extensions.dart';
import 'package:recipe_haven/core/shared_layouts/app_screen_top_layout.dart';

class BuildTopLayout extends StatelessWidget {
  const BuildTopLayout({
    super.key,
    this.hasPreviousScreen = false,
    this.title,
    this.trailing,
    this.onSkipPressed,
  }) : assert(trailing == null || onSkipPressed == null);
  final bool hasPreviousScreen;
  final String? title;
  final Widget? trailing;
  final Function()? onSkipPressed;

  @override
  Widget build(BuildContext context) {
    return AppScreenTopLayout(
      leading: hasPreviousScreen.let(
        (hasPreviousScreen) => IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      title: title.let(
        (title) => Text(
          title,
          style: context.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
      trailing:
          trailing ??
          onSkipPressed.let(
            (onSkipPressed) => TextButton(
              onPressed: onSkipPressed,
              child: Text('Skip', style: context.bodyMedium),
            ),
          ),
    );
  }
}
