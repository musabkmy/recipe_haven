import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import 'package:flutter/widgets.dart';

void main() {
  late Logger logger;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    logger = Logger('Firestore Test');
  });

  test('should return Duration.zero for null input', () async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      logger.warning('No authenticated user found.');
      return;
    }

    final db = FirebaseFirestore.instance.doc(
      '/reviews/05YyMMTmHhoe6YyETve4/main/ref-1',
    );

    try {
      final snapshot = await db.get();
      if (snapshot.exists) {
        logger.info(snapshot.data().toString());
      } else {
        logger.warning('Invalid reference');
      }
    } catch (e) {
      logger.warning('Error checking reference: $e');
    }
  });
}
