//key: reference, value: SubReview
typedef SubReviewsMap = Map<String, SubReview?>;

class SubReview {
  final String id;
  final String userID;
  final String userName;
  final String? userProfilePic;
  final DateTime publishedAt;
  final String comment;
  final String mainReviewId;

  SubReview({
    required this.id,
    required this.userID,
    required this.userName,
    required this.userProfilePic,
    required this.publishedAt,
    required this.comment,
    required this.mainReviewId,
  });
}
