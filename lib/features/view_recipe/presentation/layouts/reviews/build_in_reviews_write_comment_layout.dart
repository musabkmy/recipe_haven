import 'dart:io' show File;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/extensions/object_extension.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/animation/animation_service.dart';
import 'package:recipe_haven/core/shared_layouts/app_confirm_dialog.dart';
import 'package:recipe_haven/core/shared_layouts/app_dialog.dart';
import 'package:recipe_haven/core/shared_layouts/app_overlay.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_button.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_form_field.dart';
import 'package:recipe_haven/features/user/domain/entities/user_data_entity.dart';
import 'package:recipe_haven/features/user/presentation/state_management/bloc/user_bloc.dart';
import 'package:recipe_haven/features/view_recipe/presentation/blocs/create_review_bloc/create_review_bloc.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/reviews/take_or_choose_photo_dialog.dart';

class BuildInReviewsCreateReviewLayout extends StatefulWidget {
  const BuildInReviewsCreateReviewLayout(
    this.recipeRef,
    this.commentSectionHeight,
    this.createCommentImageSectionHeight, {
    super.key,
  });
  final dynamic recipeRef;
  final double commentSectionHeight;
  final double createCommentImageSectionHeight;

  @override
  State<BuildInReviewsCreateReviewLayout> createState() =>
      _BuildInReviewsCreateReviewLayoutState();
}

class _BuildInReviewsCreateReviewLayoutState
    extends State<BuildInReviewsCreateReviewLayout> {
  final TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserBloc, UserState, UserData?>(
      selector: (state) {
        if (state is UserDataFetched) {
          return state.userData;
        }
        return null;
      },
      builder: (context, userData) {
        if (userData != null) {
          return _buildCommentSection(userData);
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget _buildCommentSection(UserData userData) {
    return BlocConsumer<CreateReviewBloc, CreateReviewState>(
      listener: (context, state) {
        if (state is CreateReviewInitial && state.isLoading) {
          LoadingOverlay.show(context);
        } else if (state is CreateReviewFailure) {
          LoadingOverlay.hide(context);
          appConfirmDialog(
            context,
            cancelTitle: 'OK',
            title: state.message,
            onAction: () => context.pop(),
          );
        } else {
          LoadingOverlay.hide(context);
        }
      },
      builder: (context, state) {
        final comment = state is CreateReviewInitial ? state.comment : null;
        final images = state is CreateReviewInitial ? state.images : null;
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
                _buildMiniWriteCommentLayout(context, comment, userData),
                _buildCommentImages(
                  widget.createCommentImageSectionHeight,
                  images,
                ),
                SizedBox(height: AppSpacing.md),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMiniWriteCommentLayout(
    BuildContext context,
    String? comment,
    UserData userData,
  ) {
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
                  context.read<CreateReviewBloc>().add(AddImage(image));
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
              controller: _commentController,
              onChanged: (p0) {},
              onFieldSubmitted: (comment) {
                comment.let(
                  (comment) =>
                      context.read<CreateReviewBloc>().add(AddComment(comment)),
                );
              },
            ),
          ),
          AppTextButton(
            label: 'Send',
            onPressed: comment.let((comment) {
              return () {
                _commentController.clear();
                context.read<CreateReviewBloc>().add(
                  AddRecipeReview(userData, widget.recipeRef),
                );
              };
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentImages(double height, List<File>? images) {
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
                      context.read<CreateReviewBloc>().add(
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
  }
}
