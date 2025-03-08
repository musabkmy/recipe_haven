extension DateTimeEx on DateTime {
  String toTimeAgoHumanFormat() {
    if (isAfter(DateTime.now())) {
      return '';
    }
    final differenceToNow = DateTime.now().difference(this);
    switch (differenceToNow.inDays) {
      case >= 365:
        return differenceToNow.inDays > 730
            ? 'about ${(differenceToNow.inDays / 365).toInt()} year ago'
            : 'about a year ago';
      case >= 28:
        return differenceToNow.inDays > 58
            ? 'about ${(differenceToNow.inDays / 58).toInt()} months ago'
            : 'about a month ago';
      case >= 1:
        return differenceToNow.inDays == 1
            ? 'a day ago'
            : 'about ${differenceToNow.inDays} days ago';

      default:
        return differenceToNow.inHours > 1
            ? '${differenceToNow.inHours} hours ago'
            : differenceToNow.inHours < 0
            ? 'just now'
            : 'an hour ago';
    }
  }
}
