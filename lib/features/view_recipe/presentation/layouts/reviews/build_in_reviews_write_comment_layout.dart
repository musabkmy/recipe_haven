import 'dart:io' show File;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart' show XFile;
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/extensions/object_extension.dart';
import 'package:recipe_haven/constants/constants.dart';
import 'package:recipe_haven/core/services/animation/animation_service.dart';
import 'package:recipe_haven/core/shared_layouts/app_confirm_dialog.dart';
import 'package:recipe_haven/core/shared_layouts/app_dialog.dart';
import 'package:recipe_haven/core/shared_layouts/app_overlay.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_button.dart';
import 'package:recipe_haven/core/shared_layouts/app_text_form_field.dart';
import 'package:recipe_haven/features/user/domain/entities/user_data_entity.dart';
import 'package:recipe_haven/features/user/presentation/state_management/bloc/user_bloc.dart';
import 'package:recipe_haven/features/view_recipe/presentation/blocs/create_review_bloc/create_review_bloc.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/reviews/take_or_choose_photo_dialog.dart';

class BuildInReviewsCreateReviewLayout extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocListener<CreateReviewBloc, CreateReviewState>(
      listener: (context, state) {
        if (state is CreateReviewLoading) {
          LoadingOverlay.show(context);
        } else if (state is CreateReviewFailure) {
          LoadingOverlay.hide(context);
          appConfirmDialog(
            context,
            cancelTitle: 'OK',
            title: state.message,
            onAction: () {
              context.read<CreateReviewBloc>().add(PreviousState());
              context.pop();
            },
          );
        } else {
          LoadingOverlay.hide(context);
        }
      },
      child: Positioned(
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
              _BuildMiniWriteCommentLayout(recipeRef),
              _BuildCommentImages(createCommentImageSectionHeight),
              SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildMiniWriteCommentLayout extends StatefulWidget {
  const _BuildMiniWriteCommentLayout(this.recipeRef);

  final dynamic recipeRef;

  @override
  State<_BuildMiniWriteCommentLayout> createState() =>
      _BuildMiniWriteCommentLayoutState();
}

class _BuildMiniWriteCommentLayoutState
    extends State<_BuildMiniWriteCommentLayout> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        spacing: AppSpacing.sl,
        children: [
          GestureDetector(
            onTap: () {
              takeOrChoosePhotoDialog(context, (XFile? image) {
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
          _BuildCommentTextFormField(_commentController),
          _BuildSendButton(widget.recipeRef, _commentController),
        ],
      ),
    );
  }
}

class _BuildCommentTextFormField extends StatelessWidget {
  const _BuildCommentTextFormField(TextEditingController commentController)
    : _commentController = commentController;

  final TextEditingController _commentController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateReviewBloc, CreateReviewState, String?>(
      selector: (state) {
        return state is CreateReviewInitial ? state.comment : null;
      },
      builder: (context, comment) {
        _commentController.text = comment ?? '';
        return Expanded(
          child: AppTextFormField(
            hintText: 'write a comment',
            // initialValue: comment ?? '',
            controller: _commentController,
            onChanged: (p0) {},
            onFieldSubmitted: (comment) {
              comment.let(
                (comment) =>
                    context.read<CreateReviewBloc>().add(AddComment(comment)),
              );
            },
          ),
        );
      },
    );
  }
}

class _BuildSendButton extends StatelessWidget {
  const _BuildSendButton(
    this.recipeRef,
    TextEditingController commentController,
  ) : _commentController = commentController;
  final dynamic recipeRef;
  final TextEditingController _commentController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateReviewBloc, CreateReviewState, String?>(
      selector: (state) {
        return state is CreateReviewInitial ? state.comment : null;
      },
      builder: (context, comment) {
        return BlocSelector<UserBloc, UserState, UserData?>(
          selector: (state) {
            return state is UserDataFetched ? state.userData : null;
          },
          builder: (context, userData) {
            return AppTextButton(
              label: 'Send',
              onPressed: comment.let((comment) {
                return () {
                  userData.letOrElse((userData) {
                    _commentController.clear();
                    context.read<CreateReviewBloc>().add(
                      AddRecipeReview(userData, recipeRef),
                    );
                  }, orElse: () => AppDialog(body: 'unauthorized access'));
                };
              }),
            );
          },
        );
      },
    );
  }
}

class _BuildCommentImages extends StatelessWidget {
  const _BuildCommentImages(this.height);
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateReviewBloc, CreateReviewState, List<XFile>?>(
      selector: (state) => state is CreateReviewInitial ? state.images : null,

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
                            File(images[index].path),
                            fit: BoxFit.cover,
                            height: height,
                            width: height,
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
