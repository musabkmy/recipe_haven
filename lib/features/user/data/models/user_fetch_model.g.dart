// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fetch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFetchModel _$UserFetchModelFromJson(Map<String, dynamic> json) =>
    UserFetchModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String,
      bio: json['bio'] as String,
      id: json['id'] as String,
      joinedDate: json['joinedDate'] as String,
      followers: (json['followers'] as num).toInt(),
      following: (json['following'] as num).toInt(),
      recipesCount: (json['recipesCount'] as num).toInt(),
      savedRecipesCount: (json['savedRecipesCount'] as num).toInt(),
      madeRecipesCount: (json['madeRecipesCount'] as num).toInt(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      ratingsCount: (json['ratingsCount'] as num).toInt(),
    );
