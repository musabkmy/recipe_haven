import 'package:equatable/equatable.dart';

typedef MeasuringUnits = List<MeasuringUnit>;

class MeasuringUnit extends Equatable {
  final String id;
  final String name;
  final String abbreviation;

  const MeasuringUnit({
    required this.id,
    required this.name,
    required this.abbreviation,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        abbreviation,
      ];
}
