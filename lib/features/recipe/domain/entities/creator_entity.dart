import 'package:equatable/equatable.dart';

typedef Creators = List<Creator>;

class Creator extends Equatable {
  final String id;
  final String name;
  final String? profilePic;
  final String? profession;
  final String? portfolioLink;
  final List<dynamic> recipesRef;

  const Creator({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.profession,
    required this.portfolioLink,
    required this.recipesRef,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    profilePic,
    profession,
    portfolioLink,
    recipesRef,
  ];
}
