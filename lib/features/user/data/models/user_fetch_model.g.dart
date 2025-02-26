// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fetch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFetchModel _$UserFetchModelFromJson(Map<String, dynamic> json) =>
    UserFetchModel(
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
      bio: json['bio'] as String?,
      id: json['id'] as String,
      joinedDate: UserFetchModel._fromTimestamp(
        json['joinedDate'] as Timestamp?,
      ),
      followers: (json['followers'] as num).toInt(),
      following: (json['following'] as num).toInt(),
      recipesCount: (json['recipesCount'] as num).toInt(),
      savedRecipesCount: (json['savedRecipesCount'] as num).toInt(),
      madeRecipesCount: (json['madeRecipesCount'] as num).toInt(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      ratingsCount: (json['ratingsCount'] as num).toInt(),
    );

Map<String, dynamic> _$UserFetchModelToJson(UserFetchModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'bio': instance.bio,
      'id': instance.id,
      'followers': instance.followers,
      'following': instance.following,
      'recipesCount': instance.recipesCount,
      'savedRecipesCount': instance.savedRecipesCount,
      'madeRecipesCount': instance.madeRecipesCount,
      'reviewsCount': instance.reviewsCount,
      'ratingsCount': instance.ratingsCount,
    };
