// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubReviewModel _$SubReviewModelFromJson(Map<String, dynamic> json) =>
    SubReviewModel(
      id: json['id'] as String,
      reviewerModel: ReviewerModel.fromJson(
        json['reviewerModel'] as Map<String, dynamic>,
      ),
      publishedAt: json['publishedAt'],
      comment: json['comment'] as String,
      mainReviewId: json['mainReviewId'] as String,
    );
