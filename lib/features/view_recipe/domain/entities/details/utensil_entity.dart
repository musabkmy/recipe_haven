import 'package:equatable/equatable.dart';

typedef Utensils = List<Utensil>;

class Utensil extends Equatable {
  final String id;
  final String name;

  const Utensil({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

extension UtensilsEx on Utensils {
  Map<String, String> get nameMap => {
    for (var element in this) element.id: element.name,
  };
}
