// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/review_entity.dart';
part 'reviewer_model.g.dart';

@JsonSerializable(createToJson: false)
@HiveType(typeId: 0, adapterName: 'ReviewerModelAdapter')
class ReviewerModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? profilePic;

  ReviewerModel(this.id, this.name, [this.profilePic]);

  factory ReviewerModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewerModelFromJson(json);

  factory ReviewerModel.fromReviewEntity(Review review) =>
      ReviewerModel(review.userID, review.userName, review.userProfilePic);

  @override
  String toString() =>
      'ReviewerModel(id: $id, name: $name, profilePic: $profilePic)';
}
