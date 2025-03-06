abstract class UserBaseModel {
  final String name;
  final String email;
  final String? photoUrl;
  final String? bio;

  UserBaseModel({
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.bio,
  });
}
