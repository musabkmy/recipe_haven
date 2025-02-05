import 'package:json_annotation/json_annotation.dart';

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

  Map<String, dynamic> toJson() => _$CreatorModelToJson(this);
}
