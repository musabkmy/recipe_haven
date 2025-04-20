import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';

class BuildCommentText extends StatelessWidget {
  const BuildCommentText({super.key, required this.comment});

  final String comment;

  @override
  Widget build(BuildContext context) {
    return Text(comment, style: context.bodyMedium);
  }
}
