class UserData {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final String? bio;
  final DateTime? joinedDate;
  final List<String> createdRecipes;
  final int followers;
  final int following;
  final int recipesCount;
  final int savedRecipesCount;
  final int madeRecipesCount;
  final int reviewsCount;
  final int ratingsCount;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.bio,
    required this.joinedDate,
    required this.createdRecipes,
    required this.followers,
    required this.following,
    required this.recipesCount,
    required this.savedRecipesCount,
    required this.madeRecipesCount,
    required this.reviewsCount,
    required this.ratingsCount,
  });
}
