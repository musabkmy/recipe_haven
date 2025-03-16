// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:recipe_haven/config/extensions/numbers_extension.dart';

import 'measuring_unit_entity.dart';

typedef WeightCounts = List<WeightCount>;

class WeightCount extends Equatable {
  final String id;
  final double count;
  final MeasuringUnit? measuringUnit;

  const WeightCount({
    required this.id,
    required this.count,
    required this.measuringUnit,
  });

  factory WeightCount.empty() =>
      WeightCount(id: '0', count: 0, measuringUnit: null);

  @override
  List<Object?> get props => [id, count];

  @override
  bool get stringify => true;
}

extension WeightCountEx on WeightCounts {
  num countIn(String id) =>
      firstWhere(
        (element) => element.id == id,
        orElse: () => WeightCount.empty(),
      ).count.intOr2Decimals;
  MeasuringUnit? measuringUnitIn(String id) =>
      firstWhere(
        (element) => element.id == id,
        orElse: () => WeightCount.empty(),
      ).measuringUnit;
}
