import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

final class Convertors {
  static DateTime fromTimestamp(Timestamp timestamp) {
    return timestamp.toDate();
  }

  static Timestamp toTimestamp(DateTime dateTime) {
    return Timestamp.fromDate(dateTime);
  }
}
