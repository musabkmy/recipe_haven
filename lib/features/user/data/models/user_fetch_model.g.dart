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
      followersRef: json['followersRef'] as List<dynamic>,
      followingRef: json['followingRef'] as List<dynamic>,
      recipesRef: json['recipesRef'] as List<dynamic>,
      savedRecipesRef: json['savedRecipesRef'] as List<dynamic>,
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      ratingsCount: (json['ratingsCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserFetchModelToJson(
  UserFetchModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'photoUrl': instance.photoUrl,
  'bio': instance.bio,
  'id': instance.id,
  'recipesRef': UserFetchModel._toEmptyArrayJson(instance.recipesRef),
  'savedRecipesRef': UserFetchModel._toEmptyArrayJson(instance.savedRecipesRef),
  'followersRef': UserFetchModel._toEmptyArrayJson(instance.followersRef),
  'followingRef': UserFetchModel._toEmptyArrayJson(instance.followingRef),
  'reviewsCount': instance.reviewsCount,
  'ratingsCount': instance.ratingsCount,
};
