import 'package:equatable/equatable.dart';

import 'measuring_unit_entity.dart';

typedef Ingredients = List<Ingredient>;

class Ingredient extends Equatable {
  final String id;
  final String name;
  final MeasuringUnit? baseUnit; // Nullable

  const Ingredient({
    required this.id,
    required this.name,
    required this.baseUnit,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
