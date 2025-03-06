import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/context_extensions.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, required this.label, this.onPressed});
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label, style: context.bodySmallAction),
    );
  }
}
