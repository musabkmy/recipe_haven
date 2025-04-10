// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fetch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UserFetchModelToJson(
  UserFetchModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'photoUrl': instance.photoUrl,
  'bio': instance.bio,
  'id': instance.id,
  'userRef': instance.userRef,
  'recipesRef': UserFetchModel._toEmptyArrayJson(instance.recipesRef),
  'savedRecipesRef': UserFetchModel._toEmptyArrayJson(instance.savedRecipesRef),
  'followersRef': UserFetchModel._toEmptyArrayJson(instance.followersRef),
  'followingRef': UserFetchModel._toEmptyArrayJson(instance.followingRef),
  'reviewsCount': instance.reviewsCount,
  'ratingsCount': instance.ratingsCount,
};
