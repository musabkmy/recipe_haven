abstract class UserBaseModel {
  final String firstName;
  final String lastName;
  final String email;
  final String photoUrl;
  final String bio;

  UserBaseModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photoUrl,
    required this.bio,
  });
}
