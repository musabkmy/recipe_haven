Duration parseHumanDuration(String? input) {
  if (input == null) {
    return Duration.zero;
  }
  int? hours = 0;
  int? minutes = 0;
  int? seconds = 0;

  if (input.contains('h')) {
    hours = int.tryParse(input.split('h')[0]);
    input = input.split('h')[1];
  }
  if (input.contains('m')) {
    minutes = int.tryParse(input.split('m')[0]);
    input = input.split('m')[1];
  }
  if (input.contains('s')) {
    seconds = int.tryParse(input.split('s')[0]);
    input = input.split('s')[1];
  }

  return Duration(
      hours: hours ?? 0, minutes: minutes ?? 0, seconds: seconds ?? 0);
}

String toHumanDuration(Duration input) {
  if (input == Duration.zero) {
    return '';
  }
  String humanDuration = '';

  if (input.inHours > 0) {
    humanDuration += '${input.inHours}h';
  }
  if ((input.inMinutes - input.inHours * 60) > 0) {
    humanDuration += '${input.inMinutes - input.inHours * 60}m';
  }
  if ((input.inSeconds - input.inMinutes * 60) > 0) {
    humanDuration += '${input.inSeconds - input.inMinutes * 60}s';
  }

  return humanDuration;
}
