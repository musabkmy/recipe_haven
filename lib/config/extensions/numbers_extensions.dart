extension FormatNumber on num {
  String get countFormat => this >= 1000000
      ? '${(this / 1000000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}M'
      : this >= 1000
          ? '${(this / 1000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}K'
          : toString();

  num get intOr2Decimals =>
      this % 1 != 0 ? double.parse(toStringAsFixed(2)) : toInt();
}
