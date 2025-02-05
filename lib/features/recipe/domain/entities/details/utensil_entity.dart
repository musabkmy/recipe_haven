import 'package:equatable/equatable.dart';

typedef Utensils = List<Utensil>;

class Utensil extends Equatable {
  final String id;
  final String name;

  const Utensil({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
