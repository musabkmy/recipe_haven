class UserData {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final String? bio;
  final DateTime? joinedDate;
  final List<dynamic> recipesRef;
  final List<dynamic> savedRecipesRef;
  final List<dynamic> followersRef;
  final List<dynamic> followingRef;
  final int reviewsCount;
  final int? ratingsCount;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.bio,
    required this.joinedDate,
    required this.recipesRef,
    required this.savedRecipesRef,
    required this.followersRef,
    required this.followingRef,
    required this.reviewsCount,
    required this.ratingsCount,
  });
}
