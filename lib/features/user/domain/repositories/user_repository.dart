import 'package:recipe_haven/core/exceptions/creator_exceptions.dart';
import 'package:recipe_haven/core/exceptions/user_exceptions.dart';
import 'package:recipe_haven/features/recipe/recipe.dart';
import 'package:recipe_haven/features/user/data/models/models.dart';
import 'package:recipe_haven/features/user/domain/entities/user_data_entity.dart';

typedef UserResponse = Result<UserData, UserException>;
typedef CreatorsResponse = Result<Creators, CreatorException>;

abstract class UserRepository {
  Future<UserResponse> createUserWithEmailAndPassword(
    UserCreationModel userCreation,
  );
  Future<UserResponse> createUserRecord(UserFetchModel userFetch);
  Future<UserResponse> getUserData();
  Future<CreatorsResponse> getCreators();
}
