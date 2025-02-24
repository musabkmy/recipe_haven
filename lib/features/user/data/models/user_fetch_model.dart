import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/user/data/models/user_base_model.dart';
import 'package:recipe_haven/features/user/domain/entities/user_entity.dart';
part 'user_fetch_model.g.dart';

@JsonSerializable(createToJson: false)
class UserFetchModel extends UserBaseModel {
  final String id;
  final String joinedDate;
  final int followers;
  final int following;
  final int recipesCount;
  final int savedRecipesCount;
  final int madeRecipesCount;
  final int reviewsCount;
  final int ratingsCount;

  UserFetchModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.photoUrl,
    required super.bio,
    required this.id,
    required this.joinedDate,
    required this.followers,
    required this.following,
    required this.recipesCount,
    required this.savedRecipesCount,
    required this.madeRecipesCount,
    required this.reviewsCount,
    required this.ratingsCount,
  });
  factory UserFetchModel.fromJson(Map<String, dynamic> json) =>
      _$UserFetchModelFromJson(json);

  User toEntity() => User(
    id: id,
    firstName: firstName,
    lastName: lastName,
    email: email,
    photoUrl: photoUrl,
    bio: bio,
    joinedDate: joinedDate,
    followers: followers,
    following: following,
    recipesCount: recipesCount,
    savedRecipesCount: savedRecipesCount,
    madeRecipesCount: madeRecipesCount,
    reviewsCount: reviewsCount,
    ratingsCount: ratingsCount,
  );
}
