extension FormatNumber on int {
  String get countFormat => this >= 1000000
      ? '${(this / 1000000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}M'
      : this >= 1000
          ? '${(this / 1000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}K'
          : toString();
}
