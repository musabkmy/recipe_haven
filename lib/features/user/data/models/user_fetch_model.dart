import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/user/data/models/user_base_model.dart';
import 'package:recipe_haven/features/user/data/models/user_creation_model.dart';
import 'package:recipe_haven/features/user/domain/entities/user_data_entity.dart';
part 'user_fetch_model.g.dart';

@JsonSerializable()
class UserFetchModel extends UserBaseModel {
  final String id;
  @JsonKey(includeToJson: false, fromJson: _fromTimestamp)
  final DateTime? joinedDate;
  final int followers;
  final int following;
  final int recipesCount;
  final int savedRecipesCount;
  final int madeRecipesCount;
  final int reviewsCount;
  final int ratingsCount;

  UserFetchModel({
    required super.name,
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
  static const String collectionId = 'users';

  factory UserFetchModel.fromJson(Map<String, dynamic> json) =>
      _$UserFetchModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserFetchModelToJson(this);

  factory UserFetchModel.fromCreation(
    String id,
    UserCreationModel userCreationModel,
  ) => UserFetchModel(
    id: id,
    name: userCreationModel.name,
    email: userCreationModel.email,
    photoUrl: userCreationModel.photoUrl,
    bio: userCreationModel.bio,
    joinedDate: null,
    followers: 0,
    following: 0,
    recipesCount: 0,
    savedRecipesCount: 0,
    madeRecipesCount: 0,
    reviewsCount: 0,
    ratingsCount: 0,
  );

  UserData toEntity() => UserData(
    id: id,
    name: name,
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
  static DateTime? _fromTimestamp(Timestamp? timestamp) {
    return timestamp?.toDate();
  }
}
