import 'package:flutter/cupertino.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';

void appOptionsDialog(
  BuildContext context, {
  List<Widget>? actions,
  required void Function() onCancel,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        actions: actions,
        cancelButton: CupertinoActionSheetAction(
          onPressed: onCancel,
          child: Text('Cancel', style: context.bodyMedium),
        ),
      );
    },
  );
}
