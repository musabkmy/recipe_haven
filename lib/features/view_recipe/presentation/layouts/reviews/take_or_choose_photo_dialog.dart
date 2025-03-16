import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'dart:io';

import 'package:recipe_haven/core/shared_layouts/app_options_dialog.dart';

void takeOrChoosePhotoDialog(
  BuildContext context,
  Function(File?) onImagePicked,
) {
  appOptionsDialog(
    context,
    actions: [
      CupertinoDialogAction(
        child: Text('Take a photo', style: context.bodySmallAction),
        onPressed: () async {
          context.pop();
          final image = await _pickImage(ImageSource.camera);
          onImagePicked(image);
        },
      ),
      CupertinoDialogAction(
        child: Text('Choose a photo', style: context.bodySmallAction),
        onPressed: () async {
          context.pop();
          final image = await _pickImage(ImageSource.gallery);
          onImagePicked(image);
        },
      ),
    ],
    onCancel: () {
      //because using auto route
      context.pop();
      onImagePicked(null);
    },
  );
}

Future<File?> _pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);

  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}
