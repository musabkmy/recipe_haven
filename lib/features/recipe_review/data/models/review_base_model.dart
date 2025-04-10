// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';

abstract class ReviewBaseModel {
  final String id;
  final ReviewerModel reviewerModel;
  //change to hard typed
  //Ex: a month ago, a year ago
  final DateTime publishedAt;
  final String comment;

  const ReviewBaseModel(
    this.id,
    this.reviewerModel,
    this.publishedAt,
    this.comment,
  );

  @override
  String toString() {
    return 'ReviewBaseModel(id: $id, reviewerModel: $reviewerModel, publishedAt: $publishedAt, comment: $comment)';
  }
}
