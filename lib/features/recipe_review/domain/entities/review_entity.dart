// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

///key: id, value: review
typedef ReviewsMap = Map<String, Review>;
typedef Reviews = List<Review>;

class Review extends Equatable {
  final String id;
  final String userID;
  final String userName;
  final String? userProfilePic;
  final List<String> imagesUrl;
  final double? rating;
  final DateTime publishedAt;
  final String comment;
  final int favCount;
  final dynamic ref;
  final List<dynamic> subsRef;

  const Review({
    required this.id,
    required this.userID,
    required this.userName,
    required this.userProfilePic,
    required this.imagesUrl,
    this.rating,
    required this.publishedAt,
    required this.comment,
    required this.ref,
    required this.subsRef,
    this.favCount = 0,
  });

  @override
  List<Object?> get props => [id];

  factory Review.empty() {
    return Review(
      id: '',
      userID: '',
      userName: 'Unknown',
      userProfilePic: '',
      imagesUrl: [],
      publishedAt: DateTime.now(),
      subsRef: [],
      ref: null,
      comment: '',
    );
  }

  @override
  bool get stringify => true;
}

extension ReviewsEx on Reviews {
  bool get hasImages => numOfReviewsImages() > 0;
  int numOfReviewsImages() {
    int count = 0;
    for (final review in this) {
      if (review.imagesUrl.isNotEmpty) {
        count++;
      }
    }
    return count;
  }

  Map<String, List<String>> reviewsImages() {
    Map<String, List<String>> images = {};

    if (isNotEmpty) {
      for (int i = 0; i < length; i++) {
        if (this[i].imagesUrl.isNotEmpty) {
          images[this[i].id] = this[i].imagesUrl;
        }
      }
    }
    return images;
  }
}
