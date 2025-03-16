// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:recipe_haven/features/view_recipe/domain/entities/creator_entity.dart';

typedef CreatorModels = List<CreatorModel>;
// part 'creator_model.g.dart';

// @JsonSerializable()
class CreatorModel {
  final String id;
  final String name;
  final String? profilePic;
  final String? profession;
  final String? portfolioLink;
  final List<dynamic> recipesRef;

  const CreatorModel({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.profession,
    required this.portfolioLink,
    required this.recipesRef,
  });

  // factory CreatorModel.fromJson(Map<String, dynamic> json) =>
  //     _$CreatorModelFromJson(json);

  factory CreatorModel.fromUser(Map<String, dynamic> json) => CreatorModel(
    id: json['id'],
    name: json['name'],
    profilePic: json['photoUrl'],
    profession: json['bio'],
    portfolioLink: json['bio'],
    recipesRef: json['recipesRef'],
  );

  factory CreatorModel.fromEntity(Creator entity) => CreatorModel(
    id: entity.id,
    name: entity.name,
    profilePic: entity.profilePic,
    profession: entity.profession,
    portfolioLink: entity.portfolioLink,
    recipesRef: [],
  );

  // Map<String, dynamic> toJson() => _$CreatorModelToJson(this);

  // static Map<String, dynamic> toJson(CreatorModel instance) {
  //   return _$CreatorModelToJson(instance);
  // }

  Creator toEntity() => Creator(
    id: id,
    name: name,
    profilePic: profilePic,
    profession: profession,
    portfolioLink: portfolioLink,
    recipesRef: recipesRef,
  );

  @override
  String toString() {
    return 'CreatorModel(id: $id, name: $name, profilePic: $profilePic, profession: $profession, portfolioLink: $portfolioLink)';
  }
}

extension CreatorsEx on CreatorModels {
  Creators toEntity() => map((item) => item.toEntity()).toList();
}
