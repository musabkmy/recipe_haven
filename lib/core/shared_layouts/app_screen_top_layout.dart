import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/constants.dart';

class AppScreenTopLayout extends StatelessWidget {
  const AppScreenTopLayout({
    super.key,
    this.leading,
    this.title,
    this.trailing,
  });
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ?? SizedBox.shrink(),
          title ?? SizedBox.shrink(),
          trailing ?? SizedBox.shrink(),
        ],
      ),
    );
  }
}
