import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/recipe/domain/entities/creator_entity.dart';

part 'creator_model.g.dart';

@JsonSerializable()
class CreatorModel {
  final String id;
  final String name;
  final String profilePic;
  final String profession;
  final String portfolioLink;

  const CreatorModel(
      {required this.id,
      required this.name,
      required this.profilePic,
      required this.profession,
      required this.portfolioLink});

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);

  factory CreatorModel.fromEntity(Creator entity) => CreatorModel(
      id: entity.id,
      name: entity.name,
      profilePic: entity.profilePic,
      profession: entity.profession,
      portfolioLink: entity.portfolioLink);

  // Map<String, dynamic> toJson() => _$CreatorModelToJson(this);

  static Map<String, dynamic> toJson(CreatorModel instance) {
    return _$CreatorModelToJson(instance);
  }

  Creator toEntity() => Creator(
      id: id,
      name: name,
      profilePic: profilePic,
      profession: profession,
      portfolioLink: portfolioLink);
}
