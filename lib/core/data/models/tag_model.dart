import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/view_recipe/domain/entities/tag_entity.dart';
part 'tag_model.g.dart';

typedef TagModels = List<TagModel>;

@JsonSerializable(createToJson: false)
class TagModel {
  final String name;
  final String backgroundImage;
  final List<dynamic> recipes;

  TagModel({
    required this.name,
    required this.backgroundImage,
    required this.recipes,
  });

  static String collectionId = 'tags';

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);

  Tag toEntity() =>
      Tag(name: name, imgUrl: backgroundImage, recipesRef: recipes);
}

extension TagModelsEx on TagModels {
  Tags toEntity() => map((element) => element.toEntity()).toList();
}
