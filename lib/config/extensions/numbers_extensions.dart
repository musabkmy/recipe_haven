extension FormatNumber on num {
  String get countFormat => this >= 1000000
      ? '${(this / 1000000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}M'
      : this >= 1000
          ? '${(this / 1000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}K'
          : toString();

  num get intOr2Decimals =>
      this % 1 != 0 ? double.parse(toStringAsFixed(2)) : toInt();
  String get weightFormat => this % 1 == 0
      ? toString()
      : this % 1 >= .75
          ? '${toInt()} ¾'
          : this % 1 >= .30
              ? '${toInt()} ½'
              : '${toInt()} ¼';
}
