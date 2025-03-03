// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

typedef Tags = List<Tag>;

class Tag extends Equatable {
  final String name;
  final String imgUrl;
  final List<dynamic> recipesRef;

  const Tag({
    required this.name,
    required this.imgUrl,
    required this.recipesRef,
  });

  @override
  List<Object?> get props => [name, imgUrl, recipesRef];

  @override
  String toString() =>
      'Tag(name: $name, imgUrl: $imgUrl, recipesRef: $recipesRef)';
}
