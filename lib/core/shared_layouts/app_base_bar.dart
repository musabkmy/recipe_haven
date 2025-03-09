import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/constants/constants.dart';

class AppBaseBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool withElevation;

  const AppBaseBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.withElevation = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: AppColors.lightOverlayColor,
      elevation: withElevation ? 1 : 0,
      scrolledUnderElevation: 0,
      title: Text(title, style: context.headlineSmall),
      toolbarHeight: 68,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
