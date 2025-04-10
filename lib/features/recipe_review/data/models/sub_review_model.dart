import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/recipe_review/data/models/review_base_model.dart';
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';
part 'sub_review_model.g.dart';

//key: reference, value: SubReviewModel
typedef SubReviewModelMaps = Map<String, SubReviewModel>;

@JsonSerializable(createToJson: false)
class SubReviewModel extends ReviewBaseModel {
  final String mainReviewId;
  SubReviewModel({
    required String id,
    required ReviewerModel reviewerModel,
    required DateTime publishedAt,
    required String comment,
    required this.mainReviewId,
  }) : super(id, reviewerModel, publishedAt, comment);
  factory SubReviewModel.fromJson(Map<String, dynamic> json) =>
      _$SubReviewModelFromJson(json);
  static SubReviewModelMaps fromJsonS(List<dynamic> json) {
    final SubReviewModelMaps map = const {};
    for (var e in json) {
      map.putIfAbsent(
        e['id'],
        () => SubReviewModel.fromJson(e as Map<String, dynamic>),
      );
    }
    return map;
  }
}
