import 'package:flutter/material.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/config/extensions/date_time_extension.dart';
import 'package:recipe_haven/constants/app_icons.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_button.dart';

class BuildNameAndDate extends StatelessWidget {
  const BuildNameAndDate({
    super.key,
    required this.name,
    required this.publishedAt,
  });

  final String name;
  final DateTime publishedAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.top,
                child: AppTextButton(
                  onPressed: () {
                    //TODO: to creator profile
                  },
                  label: name,
                ),
              ),
              TextSpan(
                text: '\n${publishedAt.toTimeAgoHumanFormat()}',
                style: context.bodySmall,
              ),
            ],
          ),
        ),
        Icon(AppIcons.flag),
      ],
    );
  }
}
