import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/data/mocking_sources/user_mock_source.dart';
import 'package:recipe_haven/core/data/models/models.dart';
import 'package:recipe_haven/core/exceptions/user_exceptions.dart';
import 'package:recipe_haven/features/recipe/domain/repositories/repositories.dart';
import 'package:recipe_haven/features/user/data/models/user_creation_model.dart';
import 'package:recipe_haven/features/user/data/models/user_fetch_model.dart';
import 'package:recipe_haven/features/user/domain/repositories/user_repository.dart';

@Injectable(as: UserRepository, env: [Env.dev])
class UserRepositoryTestImpl extends UserRepository {
  final UserMockSource _userMockSource;
  UserRepositoryTestImpl(this._userMockSource);
  @override
  Future<UserResponse> createUserRecord(UserFetchModel userFetch) {
    return Future.value(Failure(UserException('no implementation')));
  }

  @override
  Future<UserResponse> createUserWithEmailAndPassword(
    UserCreationModel userCreation,
  ) {
    return Future.value(Failure(UserException('no implementation')));
  }

  @override
  Future<CreatorsResponse> getCreators() {
    final creators =
        _userMockSource.getUserFetchModels
            .map(
              (element) => CreatorModel.fromUser(
                UserFetchModel.fromCreation(element.name, element).toJson(),
              ),
            )
            .toList();
    return Future.value(Success(creators.toEntity()));
  }

  @override
  Future<UserResponse> getUserData() {
    return Future.value(Success(_userMockSource.getUserData.toEntity()));
  }
}
