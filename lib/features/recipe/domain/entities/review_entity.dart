import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';

typedef Reviews = List<Review>;

class Review extends Equatable {
  final String id;
  final String userID;
  final String userName;
  final String? userProfilePic;
  final List<String> imagesUrl;
  final double rating;
  final DateTime publishedAt;
  final String description;

  const Review({
    required this.id,
    required this.userID,
    required this.userName,
    required this.userProfilePic,
    required this.imagesUrl,
    required this.rating,
    required this.publishedAt,
    required this.description,
  });

  @override
  List<Object?> get props => [id];
}

extension ReviewsEx on Reviews {
  bool get hasImages => numOfReviewsImages() > 0;
  int numOfReviewsImages() {
    int count = 0;
    forEach((review) {
      count += review.imagesUrl.length;
    });
    return count;
  }

  List<String> reviewsImages() {
    List<String> images = [];

    if (isNotEmpty) {
      for (int i = 0; i < length; i++) {
        if (this[i].imagesUrl.isNotEmpty) {
          images.addAll(this[i].imagesUrl);
        }
      }
    }
    Logger('reviewsImages').info(images.length);
    if (images.length > 4) {
      return images.take(4).toList();
    }
    return images;
  }
}
