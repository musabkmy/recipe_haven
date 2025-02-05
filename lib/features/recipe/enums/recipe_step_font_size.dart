import 'package:json_annotation/json_annotation.dart';

enum FontSize {
  @JsonValue('small')
  small('Small'),
  @JsonValue('medium')
  medium('Medium'),
  @JsonValue('large')
  large('Large');

  const FontSize(this.title);
  final String title;
}
