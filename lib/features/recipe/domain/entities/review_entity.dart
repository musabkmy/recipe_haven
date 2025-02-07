import 'package:equatable/equatable.dart';

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

  const Review(
      {required this.id,
      required this.userID,
      required this.userName,
      required this.userProfilePic,
      required this.imagesUrl,
      required this.rating,
      required this.publishedAt,
      required this.description});

  @override
  List<Object?> get props => [id];
}
