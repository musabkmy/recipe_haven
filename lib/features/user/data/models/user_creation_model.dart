import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_haven/features/user/data/models/user_base_model.dart';

part 'user_creation_model.g.dart';

@JsonSerializable(createFactory: false)
class UserCreationModel extends UserBaseModel {
  final String password;

  UserCreationModel({
    required super.name,
    required this.password,
    required super.email,
    super.photoUrl,
    super.bio,
  });

  Map<String, dynamic> toJson() => _$UserCreationModelToJson(this);
}
