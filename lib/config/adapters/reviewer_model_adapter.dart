import 'package:hive/hive.dart';
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart';

class ReviewerModelAdapter extends TypeAdapter<ReviewerModel> {
  @override
  ReviewerModel read(BinaryReader reader) {
    return ReviewerModel(reader.read(), reader.read(), reader.read());
  }

  @override
  void write(BinaryWriter writer, ReviewerModel obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.photoUrl);
  }

  @override
  int get typeId => 0;
}
