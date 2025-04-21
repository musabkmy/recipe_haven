import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/config/firestore_config/convertors.dart';
import 'package:recipe_haven/features/recipe_review/data/models/review_base_model.dart';
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';
import 'package:recipe_haven/features/recipe_review/domain/entities/sub_review_entity.dart';
part 'sub_review_model.g.dart';

//key: reference, value: SubReviewModel
typedef SubReviewModelsMap = Map<String, SubReviewModel?>;

@JsonSerializable(createToJson: false)
@HiveType(typeId: 2, adapterName: 'SubReviewModelAdapter')
class SubReviewModel extends ReviewBaseModel {
  @HiveField(4)
  final String mainReviewId;
  SubReviewModel({
    required String id,
    required ReviewerModel reviewerModel,
    required dynamic publishedAt,
    required String comment,
    required this.mainReviewId,
  }) : super(
         id,
         reviewerModel,
         publishedAt is Timestamp
             ? Convertors.fromTimestamp(publishedAt)
             : publishedAt,
         comment,
       );
  factory SubReviewModel.fromJson(Map<String, dynamic> json) =>
      _$SubReviewModelFromJson(json);
  static SubReviewModelsMap fromJsonS(List<dynamic> json) {
    final SubReviewModelsMap map = const {};
    for (var e in json) {
      map.putIfAbsent(
        e['id'],
        () => SubReviewModel.fromJson(e as Map<String, dynamic>),
      );
    }
    return map;
  }

  SubReview toEntity() => SubReview(
    id: id,
    userID: reviewerModel.id,
    userName: reviewerModel.name,
    userProfilePic: reviewerModel.photoUrl,
    mainReviewId: mainReviewId,
    publishedAt: publishedAt,
    comment: comment,
  );
}

extension SubReviewsMapEx on SubReviewModelsMap {
  SubReviewsMap toEntityMap() => {
    for (final element in entries) element.key: element.value?.toEntity(),
  };
}
