import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
<<<<<<< Updated upstream
=======
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
>>>>>>> Stashed changes
import 'package:recipe_haven/core/exceptions/creator_exceptions.dart';
import 'package:recipe_haven/core/exceptions/user_exceptions.dart';
import 'package:recipe_haven/core/recourses/data_state.dart';
import 'package:recipe_haven/core/data/data.dart';
import 'package:recipe_haven/features/user/data/models/models.dart';
import 'package:recipe_haven/features/user/domain/repositories/user_repository.dart';

<<<<<<< Updated upstream
@Injectable(as: UserRepository)
=======
@Injectable(as: UserRepository, env: [Env.prod])
>>>>>>> Stashed changes
class UserRepositoryFirebaseImpl extends UserRepository {
  @override
  Future<UserResponse> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Failure(UserException('No authenticated user found.'));
    }

    final firestore = FirebaseFirestore.instance;

    try {
      final userDoc =
          await firestore
              .collection(UserFetchModel.collectionId)
              .doc(user.uid)
              .get();

      if (!userDoc.exists || userDoc.data() == null) {
        return Failure(UserException('No user record found.'));
      }

      final fetchedUser = UserFetchModel.fromJson(userDoc.data()!);

      return Success(fetchedUser.toEntity());
    } catch (e) {
      return Failure(
        UserException('Failed to fetch user data: ${e.toString()}'),
      );
    }
  }

  @override
  Future<UserResponse> createUserWithEmailAndPassword(
    UserCreationModel userCreation,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: userCreation.email,
            password: userCreation.password,
          );
      final user = credential.user;
      if (user != null) {
        await credential.user!.updateDisplayName(userCreation.name);
        final userFetchModel = UserFetchModel.fromCreation(
          user.uid,
          userCreation,
        );
        return await createUserRecord(userFetchModel);
      } else {
        return Failure(UserException('Couldn\'t complete creation.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Failure(
          UserException(e.message ?? 'The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        return Failure(
          UserException(
            e.message ?? 'The account already exists for that email.',
          ),
        );
      } else {
        return Failure(UserException(e.message ?? 'Unknown Error.'));
      }
    } catch (e) {
      return Failure(UserException(e.toString()));
    }
  }

  @override
  Future<UserResponse> createUserRecord(UserFetchModel userFetch) async {
    final data =
        userFetch.toJson()
          ..addEntries([MapEntry('joinedDate', FieldValue.serverTimestamp())]);
    final db = FirebaseFirestore.instance;
    try {
      await db
          .collection(UserFetchModel.collectionId)
          .doc(userFetch.id)
          .set(data);
      final DocumentSnapshot snapshot =
          await db
              .collection(UserFetchModel.collectionId)
              .doc(userFetch.id)
              .get();
      if (snapshot.exists) {
        final Map<String, dynamic> jsonData =
            snapshot.data() as Map<String, dynamic>;
        final UserFetchModel fetchedUser = UserFetchModel.fromJson(jsonData);
        return Success(fetchedUser.toEntity());
      }
      return Failure(UserException('Unknown Error.'));
    } catch (e) {
      return Failure(UserException(e.toString()));
    }
  }

  @override
  Future<CreatorsResponse> getCreators() async {
    try {
      final db = FirebaseFirestore.instance;
      final querySnapshot =
          await db
              .collection(UserFetchModel.collectionId)
              // .where('createdRecipes', isGreaterThan: [])
              .get();
      if (querySnapshot.size > 0) {
        final creatorModels =
            querySnapshot.docs
                .map((doc) => CreatorModel.fromUser(doc.data()))
                .toList();

        return Success(creatorModels.toEntity());
      } else {
        return Failure(CreatorException('Couldn\'t find a creators.'));
      }
    } catch (e) {
      return Failure(CreatorException(e.toString()));
    }
  }
}
