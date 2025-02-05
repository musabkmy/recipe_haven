import 'package:equatable/equatable.dart';

class Engagement extends Equatable {
  final double rating;
  final int ratingCount;
  final double likesCount;

  const Engagement(
      {required this.rating,
      required this.ratingCount,
      required this.likesCount});

  @override
  List<Object?> get props => [rating, ratingCount, likesCount];
}
