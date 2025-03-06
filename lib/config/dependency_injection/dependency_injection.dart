import 'package:firebase_core/firebase_core.dart';
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
void configurationDependency(String env) {
  if (env == Env.prod) {
    setupFirebase();
  }
  getIt.init(environment: env);
  getIt.registerSingleton<AppRouter>(AppRouter());
}

Future<void> setupFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
