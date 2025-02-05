import 'package:equatable/equatable.dart';

import 'measuring_unit_entity.dart';

typedef Nutritious = List<Nutrition>;

class Nutrition extends Equatable {
  final String id;
  final String name;
  final MeasuringUnit? baseUnit;

  const Nutrition(
      {required this.id, required this.name, required this.baseUnit});

  @override
  List<Object?> get props => [id];
}
