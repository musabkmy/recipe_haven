class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? photoUrl;
  final String bio;
  final String joinedDate;
  final int followers;
  final int following;
  final int recipesCount;
  final int savedRecipesCount;
  final int madeRecipesCount;
  final int reviewsCount;
  final int ratingsCount;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photoUrl,
    required this.bio,
    required this.joinedDate,
    required this.followers,
    required this.following,
    required this.recipesCount,
    required this.savedRecipesCount,
    required this.madeRecipesCount,
    required this.reviewsCount,
    required this.ratingsCount,
  });
}
