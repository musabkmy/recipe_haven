import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_haven/config/extensions/context_extension.dart';
import 'package:recipe_haven/config/extensions/string_extension.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_spacing.dart';
import 'package:recipe_haven/constants/app_styles.dart';
import 'package:recipe_haven/core/home/presentation/get_tags_cubit/get_tags_cubit.dart';
import 'package:recipe_haven/core/services/image/network_image_service.dart';
import 'package:recipe_haven/core/shared_layouts/app_section_title.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/tag_entity.dart';

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
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  itemCount: tags.length,
                  itemBuilder: (context, index) {
                    final item = tags[index];
                    return _BuildItem(item, tags);
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

class _BuildItem extends StatelessWidget {
  const _BuildItem(this.item, this.tags);

  final Tag item;
  final Tags tags;

  @override
  Widget build(BuildContext context) {
    return AppNetworkImage(
      imageUrl: item.imgUrl,
      imageBuilder:
          (context, imageProvider) => Container(
            width: .8.sw,
            margin: EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm),
            padding: EdgeInsets.only(bottom: AppSpacing.xl),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: AppStyles.borderRadiusML,
              color: AppColors.mediumOverlayColor,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
  }
}
