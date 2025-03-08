import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/config/extensions/object_extension.dart';
import 'package:recipe_haven/constants/constants.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, required this.label, this.onPressed});
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        // isSemanticButton: false,
        // style: ButtonStyle(
        //   alignment: AlignmentDirectional.centerStart,
        //   padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        //   // overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
        // ),
        onTap: onPressed,
        // style: ButtonStyle(),
        child: Text(
          label,
          style: context.bodySmall.copyWith(
            color: onPressed.letOrElse(
              (_) => AppColors.deepOrange,
              orElse: () => AppColors.grey500,
            ),
          ),
        ),
      ),
    );
  }
}
