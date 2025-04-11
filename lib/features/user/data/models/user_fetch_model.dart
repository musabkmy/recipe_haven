import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/config/firestore_config/convertors.dart';
import 'package:recipe_haven/features/user/data/models/user_base_model.dart';
import 'package:recipe_haven/features/user/data/models/user_creation_model.dart';
import 'package:recipe_haven/features/user/domain/entities/user_data_entity.dart';
part 'user_fetch_model.g.dart';

@JsonSerializable(createFactory: false)
class UserFetchModel extends UserBaseModel {
  final String id;
  @JsonKey(includeToJson: false, fromJson: Convertors.fromTimestamp)
  final DateTime? joinedDate;
  final dynamic userRef;
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
    required this.userRef,
    required this.followersRef,
    required this.followingRef,
    required this.recipesRef,
    required this.savedRecipesRef,
    required this.reviewsCount,
    required this.ratingsCount,
  });
  static const String collectionId = 'users';

  factory UserFetchModel.fromJson(dynamic userRef, Map<String, dynamic> json) =>
      UserFetchModel(
        name: json['name'],
        email: json['email'],
        photoUrl: json['photoUrl'],
        bio: json['bio'],
        id: json['id'],
        joinedDate: Convertors.fromTimestamp(json['joinedDate']),
        userRef: userRef,
        followersRef: json['followersRef'],
        followingRef: json['followingRef'],
        recipesRef: json['recipesRef'],
        savedRecipesRef: json['savedRecipesRef'],
        reviewsCount: json['reviewsCount'],
        ratingsCount: json['ratingsCount'],
      );

  Map<String, dynamic> toJson() => _$UserFetchModelToJson(this);
  //temp operation
  factory UserFetchModel.fromCreation(
    String id,
    // String userRef,
    UserCreationModel userCreationModel,
  ) => UserFetchModel(
    id: id,
    name: userCreationModel.name,
    email: userCreationModel.email,
    photoUrl: userCreationModel.photoUrl,
    bio: userCreationModel.bio,
    joinedDate: null,
    userRef: '',
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
    userRef: userRef,
    recipesRef: recipesRef,
    savedRecipesRef: savedRecipesRef,
    followersRef: followersRef,
    followingRef: followingRef,
    reviewsCount: reviewsCount,
    ratingsCount: ratingsCount,
  );
  static List<dynamic> _toEmptyArrayJson(List<dynamic> list) => [];
}
