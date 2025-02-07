// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'measuring_unit_entity.dart';

typedef WeightCounts = List<WeightCount>;

class WeightCount extends Equatable {
  final String id;
  final double count;
  final MeasuringUnit? measuringUnit;

  const WeightCount(
      {required this.id, required this.count, required this.measuringUnit});

  @override
  List<Object?> get props => [
        id,
        count,
      ];

  @override
  bool get stringify => true;
}
