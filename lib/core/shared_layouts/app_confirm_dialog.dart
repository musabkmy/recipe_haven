import 'package:flutter/cupertino.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/config/extensions/object_extension.dart';

Future<bool?> appConfirmDialog(
  BuildContext context, {
  required String title,
  String? content,
  required void Function() onAction,
  required void Function() onCancel,
}) {
  return showCupertinoDialog<bool>(
    context: context,
    builder:
        (context) => CupertinoAlertDialog(
          title: Text(title, style: context.bodyLarge),
          content: content.let(
            (content) => Text(content, style: context.bodyMedium),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: onCancel,
              child: Text('Cancel', style: context.bodySmallCancelAction),
            ),
            CupertinoDialogAction(
              onPressed: onAction,
              isDestructiveAction: true,
              child: Text('Confirm', style: context.bodySmallAction),
            ),
          ],
        ),
  );
}
