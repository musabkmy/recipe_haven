import 'package:hive/hive.dart';
import 'package:recipe_haven/features/recipe_review/data/models/sub_review_model.dart';

class SubReviewModelAdapter extends TypeAdapter<SubReviewModel> {
  @override
  SubReviewModel read(BinaryReader reader) {
    return SubReviewModel(
      id: reader.read(),
      reviewerModel: reader.read(),
      publishedAt: reader.read(),
      comment: reader.read(),
      mainReviewId: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, SubReviewModel obj) {
    writer.write(obj.id);
    writer.write(obj.reviewerModel);
    writer.write(obj.publishedAt);
    writer.write(obj.comment);
    writer.write(obj.mainReviewId);
  }

  @override
  int get typeId => 2;
}
