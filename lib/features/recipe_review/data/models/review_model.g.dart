// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  id: json['id'] as String,
  reviewerModel: ReviewerModel.fromJson(
    json['reviewerModel'] as Map<String, dynamic>,
  ),
  publishedAt: json['publishedAt'],
  comment: json['comment'] as String,
  imagesUrl:
      (json['imagesUrl'] as List<dynamic>).map((e) => e as String).toList(),
  rating: (json['rating'] as num?)?.toDouble(),
  ref: json['ref'],
  subsRef: json['subsRef'] as List<dynamic>? ?? const [],
);
