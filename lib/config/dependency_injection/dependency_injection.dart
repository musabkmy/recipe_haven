<<<<<<< Updated upstream
import 'package:firebase_core/firebase_core.dart';
=======
<<<<<<< Updated upstream
=======
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
>>>>>>> Stashed changes
>>>>>>> Stashed changes
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.config.dart';
import 'package:recipe_haven/config/routes/auto_route.dart';
import 'package:recipe_haven/firebase_options.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
<<<<<<< Updated upstream
void configurationDependency(String env) {
=======
<<<<<<< Updated upstream
void configurationDependency(String env) => getIt.init(environment: env);
=======
FutureOr<void> configurationDependency(String env) async {
>>>>>>> Stashed changes
  if (env == Env.prod) {
    setupFirebase();
  }
  getIt.init(environment: env);
  getIt.registerSingleton<AppRouter>(AppRouter());
}
<<<<<<< Updated upstream
=======
>>>>>>> Stashed changes
>>>>>>> Stashed changes

Future<void> setupFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
