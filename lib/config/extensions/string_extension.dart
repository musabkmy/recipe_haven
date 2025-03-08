extension StringEx on String {
  String get capitalizeFirstChar =>
      isEmpty ? this : this[0].toUpperCase() + substring(1).toLowerCase();

  String get capitalizeEachWord =>
      split(' ').map((element) => element.capitalizeFirstChar).join(' ');
}
