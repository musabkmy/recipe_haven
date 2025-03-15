import 'dart:io' show File;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/animation/animation_service.dart';
import 'package:recipe_haven/core/shared_layouts/app_confirm_dialog.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_button.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_form_field.dart';
import 'package:recipe_haven/features/recipe/presentation/blocs/create_comment_bloc/create_comment_bloc.dart';
import 'package:recipe_haven/features/recipe/presentation/layouts/reviews/take_or_choose_photo_dialog.dart';

class BuildInReviewsWriteCommentLayout extends StatelessWidget {
  const BuildInReviewsWriteCommentLayout(
    this.commentSectionHeight,
    this.createCommentImageSectionHeight, {
    super.key,
  });
  final double commentSectionHeight;
  final double createCommentImageSectionHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 0,
      // height: commentSectionHeight,
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.sl,
        ).copyWith(top: AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.background,
          boxShadow: [AppBoxShadows.soft],
        ),
        child: Column(
          spacing: AppSpacing.sm,
          children: [
            _buildMiniWriteCommentLayout(context),
            _buildCommentImages(createCommentImageSectionHeight),
            SizedBox(height: AppSpacing.sm),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniWriteCommentLayout(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        spacing: AppSpacing.sl,
        children: [
          GestureDetector(
            onTap: () {
              takeOrChoosePhotoDialog(context, (File? image) {
                final logger = Logger('takeOrChoosePhotoDialog');
                if (image != null) {
                  context.read<CreateCommentBloc>().add(AddImage(image));
                  logger.info(image.path);
                } else {
                  logger.warning('no image');
                }
              });
            },
            child: Icon(
              AppIcons.uploadImage,
              size: 32,
              color: AppColors.deepOrange,
            ),
          ),
          Expanded(
            child: AppTextFormField(
              hintText: 'write a comment',
              initialValue: '',
              onChanged: (p0) {
                //TODO: Add Comment
              },
            ),
          ),
          AppTextButton(label: 'Send', onPressed: null),
        ],
      ),
    );
  }

  Widget _buildCommentImages(double height) {
    return BlocSelector<CreateCommentBloc, CreateCommentState, List<File>?>(
      selector: (state) {
        if (state is CreateCommentInitial) {
          return state.images;
        }
        return null;
      },
      builder: (context, images) {
        return images == null || images.isEmpty
            ? SizedBox.shrink()
            : Container(
              height: height,
              margin: EdgeInsets.symmetric(
                horizontal: AppSpacing.minHorizontal,
              ).copyWith(bottom: AppSpacing.lg),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, _) => SizedBox(width: AppSpacing.sm),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      appConfirmDialog(
                        context,
                        title: 'Remove this image?',
                        onAction: () {
                          context.read<CreateCommentBloc>().add(
                            RemoveImage(images[index]),
                          );
                          context.pop();
                        },
                        onCancel: context.pop,
                      );
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        ClipRRect(
                          borderRadius: AppStyles.borderRadiusXS,
                          child: Image.file(
                            fit: BoxFit.cover,
                            height: height,
                            width: height,
                            images[index],
                          ).fadeOutIn(key: index.toString()),
                        ),
                        Icon(
                          AppIcons.removeCircle,
                          // size: 18,
                          color: AppColors.background,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
      },
    );
  }
}
