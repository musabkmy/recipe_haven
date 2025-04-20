import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/core/shared_layouts/app_recipe_image_layout.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildImages extends StatelessWidget {
  const BuildImages({
    super.key,
    required this.controller,
    required this.imagesUrl,
  });

  final PageController controller;
  final List<String> imagesUrl;

  @override
  Widget build(BuildContext context) {
    if (imagesUrl.isEmpty) {
      return const SizedBox();
    }
    return SizedBox(
      height: .4.sh,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children:
                  imagesUrl
                      .map(
                        (item) => AppImageLayout(
                          height: .4.sh,
                          width: double.maxFinite,
                          imageUrl: item,
                        ),
                      )
                      .toList(),
            ),
          ),
          if (imagesUrl.length > 1)
            Padding(
              padding: EdgeInsets.only(top: AppSpacing.md),
              child: SmoothPageIndicator(
                controller: controller,
                count: imagesUrl.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  dotColor: AppColors.grey400,
                  activeDotColor: AppColors.lightOrange,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
