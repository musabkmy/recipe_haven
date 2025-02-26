import 'package:recipe_haven/features/recipe/recipe.dart';
import 'package:recipe_haven/features/user/data/models/models.dart';
import 'package:recipe_haven/features/user/domain/entities/user_data_entity.dart';

typedef UserResponse = Result<UserData>;

abstract class UserRepository {
  Future<UserResponse> createUserWithEmailAndPassword(
    UserCreationModel userCreation,
  );
  Future<UserResponse> createUserRecord(UserFetchModel userFetch);
}
