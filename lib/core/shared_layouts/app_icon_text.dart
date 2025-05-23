import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';

class AppIconText extends StatelessWidget {
  const AppIconText({
    super.key,
    required this.icon,
    required this.label,
    this.iconSize,
    this.labelStyle,
    this.onTap,
  });
  final IconData icon;
  final String label;
  final double? iconSize;
  final TextStyle? labelStyle;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          // text: '♡ ',
          // style: context.bodyLarge,
          children: [
            WidgetSpan(child: Icon(icon, size: iconSize ?? 18)),
            TextSpan(text: ' $label', style: labelStyle ?? context.bodySmall),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
