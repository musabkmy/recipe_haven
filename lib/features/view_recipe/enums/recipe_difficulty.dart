import 'package:json_annotation/json_annotation.dart';

enum Difficulty {
  @JsonValue('easy')
  easy('Easy'),
  @JsonValue('medium')
  medium('Medium'),
  @JsonValue('hard')
  hard('Hard'),
  @JsonValue('unknown')
  unknown('Unknown');

  const Difficulty(this.name);

  final String name;
}
