import 'package:hive/hive.dart';
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';

@HiveType(typeId: 1)
abstract class ReviewBaseModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final ReviewerModel reviewerModel;
  //change to hard typed
  //Ex: a month ago, a year ago
  @HiveField(2)
  final DateTime publishedAt;
  @HiveField(3)
  final String comment;

  ReviewBaseModel(this.id, this.reviewerModel, this.publishedAt, this.comment);

  @override
  String toString() {
    return 'ReviewBaseModel(id: $id, reviewerModel: $reviewerModel, publishedAt: $publishedAt, comment: $comment)';
  }
}
