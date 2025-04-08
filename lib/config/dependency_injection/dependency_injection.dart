import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.config.dart';
import 'package:recipe_haven/config/routes/auto_route.dart';
import 'package:recipe_haven/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
FutureOr<void> configurationDependency(String env) async {
  if (env == Env.prod) {
    await setupFirebase();
  }
  await setupSupabase();
  getIt.init(environment: env);
  getIt.registerSingleton<AppRouter>(AppRouter());
}

Future<void> setupFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> setupSupabase() async {
  await dotenv.load(fileName: ".env");

  debugPrint(
    'read all vars? ${dotenv.isEveryDefined(['SUPABASE_URL', 'SUPABASE_ANON_KEY'])}',
  );

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  final supabase = Supabase.instance.client;

  // await supabase.auth.signInAnonymously();
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
