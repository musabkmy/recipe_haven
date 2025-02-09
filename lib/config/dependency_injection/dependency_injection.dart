import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configurationDependency(String env) => getIt.init(environment: env);

//insure RecipeInfoBloc is properly registered
// void setupDependencies() {
//   getIt.registerSingleton<RecipeInfoBloc>(RecipeInfoBloc());
// }

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
