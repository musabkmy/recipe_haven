import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/context_extensions.dart';
import 'package:recipe_haven/config/extensions/string_extensions.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/constants/app_styles.dart';
import 'package:recipe_haven/core/home/presentation/get_tags_cubit/get_tags_cubit.dart';
import 'package:recipe_haven/core/shared_layouts/shared_layouts.dart';

class BuildTagsQuickLinks extends StatelessWidget {
  const BuildTagsQuickLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTagsCubit, GetTagsState>(
      builder: (context, state) {
        if (state is GetTagsSuccess) {
          final tags = state.tags;
          return Column(
            spacing: AppSpacing.md,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSectionTitle('Quick Links For You'),
              SizedBox(
                height: .4.sh,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tags.length,
                  itemBuilder: (context, index) {
                    final item = tags[index];
                    return CachedNetworkImage(
                      imageUrl: item.imgUrl,
                      imageBuilder:
                          (context, imageProvider) => Container(
                            width: .8.sw,
                            margin: EdgeInsetsDirectional.only(
                              start:
                                  index == 0
                                      ? AppSpacing.minHorizontal
                                      : AppSpacing.sm,
                              end:
                                  index == tags.length - 1
                                      ? AppSpacing.minHorizontal
                                      : AppSpacing.sm,
                            ),
                            padding: EdgeInsets.only(bottom: AppSpacing.xl),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: AppStyles.borderRadiusML,
                              color: AppColors.mediumOverlayColor,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Text(
                              item.name.capitalizeEachWord,
                              style: context.headlineMedium.copyWith(
                                color: AppColors.background,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
