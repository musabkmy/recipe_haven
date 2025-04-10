// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateReviewModelToJson(CreateReviewModel instance) =>
    <String, dynamic>{
      'userRef': instance.userRef,
      'comment': instance.comment,
      'imagesUrl': instance.imagesUrl,
      'recipeRef': instance.recipeRef,
      'parentReviewRef': instance.parentReviewRef,
      'rating': instance.rating,
      'reviewType': _$ReviewTypeEnumMap[instance.reviewType]!,
    };

const _$ReviewTypeEnumMap = {
  ReviewType.recipeReview: 'recipeReview',
  ReviewType.recipeReply: 'recipeReply',
};
