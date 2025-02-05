import 'package:equatable/equatable.dart';

class Creator extends Equatable {
  final String id;
  final String name;
  final String profilePic;
  final String profession;
  final String portfolioLink;

  const Creator(
      {required this.id,
      required this.name,
      required this.profilePic,
      required this.profession,
      required this.portfolioLink});

  @override
  List<Object?> get props => [
        id,
        name,
        profilePic,
        profession,
        portfolioLink,
      ];
}
