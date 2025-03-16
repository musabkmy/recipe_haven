import 'package:equatable/equatable.dart';

typedef MeasuringUnits = List<MeasuringUnit>;

class MeasuringUnit extends Equatable {
  final String name;
  final String abbreviation;

  const MeasuringUnit({
    required this.name,
    required this.abbreviation,
  });

  @override
  List<Object?> get props => [
        name,
        abbreviation,
      ];
}
