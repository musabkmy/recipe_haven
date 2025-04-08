extension DurationEx on Duration {
  String inJsonDuration() {
    if (this == Duration.zero) {
      return '';
    }
    String humanDuration = '';

    if (inHours > 0) {
      humanDuration += '${inHours}h';
    }
    if ((inMinutes - inHours * 60) > 0) {
      humanDuration += '${inMinutes - inHours * 60}m';
    }
    if ((inSeconds - inMinutes * 60) > 0) {
      humanDuration += '${inSeconds - inMinutes * 60}s';
    }

    return humanDuration;
  }

  String inTextDuration() {
    if (this == Duration.zero) {
      return '';
    }
    String humanDuration = '';

    if (inHours > 0) {
      humanDuration += '$inHours h';
    }
    if ((inMinutes - inHours * 60) > 0) {
      humanDuration += '${inMinutes - inHours * 60} min';
    }
    if ((inSeconds - inMinutes * 60) > 0) {
      humanDuration += '${inSeconds - inMinutes * 60} sec';
    }

    return humanDuration;
  }

  double inDurationPercentage() {
    // Logger('ininDurationPercentage').info((inMinutes / 60).toStringAsFixed(1));

    if (this == Duration.zero) {
      return 0;
    }

    ///not needed here: inDays >= 1 || inHours >= 1 ||
    if (inMinutes >= 60) {
      return 1;
    }
    if (inMinutes >= 1) {
      return double.parse((inMinutes / 60).toStringAsFixed(1));
    }
    if (inSeconds >= 60) {
      return 1;
    }
    if (inSeconds >= 1) {
      return double.parse((inSeconds / 60).toStringAsFixed(1));
    }
    return 0.1;
  }
}
