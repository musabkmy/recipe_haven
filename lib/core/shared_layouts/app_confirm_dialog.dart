import 'package:flutter/cupertino.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/config/extensions/object_extension.dart';

Future<bool?> appConfirmDialog(
  BuildContext context, {
  required String title,
  String actionTitle = 'Confirm',
  String cancelTitle = 'Cancel',
  String? content,
  required void Function() onAction,
  void Function()? onCancel,
}) {
  return showCupertinoDialog<bool>(
    context: context,
    builder:
        (context) => CupertinoAlertDialog(
          title: Text(title, style: context.bodyLarge),
          content: content.let(
            (content) => Text(content, style: context.bodyMedium),
          ),
          actions:
              onCancel != null
                  ? [
                    CupertinoDialogAction(
                      onPressed: onCancel,
                      child: Text(
                        cancelTitle,
                        style: context.bodySmallCancelAction,
                      ),
                    ),
                    CupertinoDialogAction(
                      onPressed: onAction,
                      isDestructiveAction: true,
                      child: Text(actionTitle, style: context.bodySmallAction),
                    ),
                  ]
                  : [
                    CupertinoDialogAction(
                      onPressed: onAction,
                      isDefaultAction: true,
                      child: Text(actionTitle, style: context.bodySmall),
                    ),
                  ],
        ),
  );
}
