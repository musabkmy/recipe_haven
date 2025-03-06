import 'package:flutter/material.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/core/enums/validation_type.dart';

extension ValidationTypeEx on ValidationType {
  Widget? get suffixLayout {
    switch (this) {
      case ValidationType.unset:
        return null;
      case ValidationType.invalid:
        return _BuildInvalidSuffix();
      case ValidationType.processing:
        return _BuildProcessingSuffix();
      case ValidationType.valid:
        return _BuildValidSuffix();
    }
  }
}

final class _BuildInvalidSuffix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.clear_rounded, color: AppColors.error);
  }
}

final class _BuildValidSuffix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.check_rounded, color: AppColors.valid);
  }
}

final class _BuildProcessingSuffix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.grey400,
      constraints: BoxConstraints(maxHeight: 24, maxWidth: 24),
    );
  }
}
