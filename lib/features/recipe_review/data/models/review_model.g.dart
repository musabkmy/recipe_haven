// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  id: json['id'] as String,
  userID: json['userID'] as String,
  userName: json['userName'] as String,
  userProfilePic: json['userProfilePic'] as String?,
  imagesUrl:
      (json['imagesUrl'] as List<dynamic>).map((e) => e as String).toList(),
  rating: (json['rating'] as num?)?.toDouble(),
  publishedAt: DateTime.parse(json['publishedAt'] as String),
  description: json['description'] as String,
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'userProfilePic': instance.userProfilePic,
      'userName': instance.userName,
      'imagesUrl': instance.imagesUrl,
      'rating': instance.rating,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'description': instance.description,
    };
