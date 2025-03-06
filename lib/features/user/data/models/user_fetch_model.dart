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
  @JsonKey(toJson: _toEmptyArrayJson)
  final List<dynamic> recipesRef;
  @JsonKey(toJson: _toEmptyArrayJson)
  final List<dynamic> savedRecipesRef;
  @JsonKey(toJson: _toEmptyArrayJson)
  final List<dynamic> followersRef;
  @JsonKey(toJson: _toEmptyArrayJson)
  final List<dynamic> followingRef;
  final int reviewsCount;
  final int? ratingsCount;

  UserFetchModel({
    required super.name,
    required super.email,
    required super.photoUrl,
    required super.bio,
    required this.id,
    required this.joinedDate,
    required this.followersRef,
    required this.followingRef,
    required this.recipesRef,
    required this.savedRecipesRef,
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
    recipesRef: [],
    savedRecipesRef: [],
    followersRef: [],
    followingRef: [],
    reviewsCount: 0,
    ratingsCount: null,
  );

  UserData toEntity() => UserData(
    id: id,
    name: name,
    email: email,
    photoUrl: photoUrl,
    bio: bio,
    joinedDate: joinedDate,
    recipesRef: recipesRef,
    savedRecipesRef: savedRecipesRef,
    followersRef: followersRef,
    followingRef: followingRef,
    reviewsCount: reviewsCount,
    ratingsCount: ratingsCount,
  );
  static List<dynamic> _toEmptyArrayJson(List<dynamic> list) => [];

  static DateTime? _fromTimestamp(Timestamp? timestamp) {
    return timestamp?.toDate();
  }
}
