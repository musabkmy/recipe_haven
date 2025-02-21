// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/recipe/data/repositories/recipe_repository_firebase_impl.dart'
    as _i213;
import '../../features/recipe/data/repositories/recipe_repository_test_impl.dart'
    as _i976;
import '../../features/recipe/data/testing_sources/recipe_testing_source.dart'
    as _i703;
import '../../features/recipe/presentation/get_recipes_cubit/get_recipes_cubit.dart'
    as _i226;
import '../../features/recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart'
    as _i242;
import '../../features/recipe/recipe.dart' as _i1012;

const String _prod = 'prod';
const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i703.RecipeTestingSource>(() => _i703.RecipeTestingSource());
    gh.singleton<_i242.RecipeInfoBloc>(() => _i242.RecipeInfoBloc());
    gh.factory<_i1012.RecipeRepository>(
      () => _i213.RecipeRepositoryFirebaseImpl(gh<_i703.RecipeTestingSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i226.GetRecipesCubit>(
      () => _i226.GetRecipesCubit(gh<_i1012.RecipeRepository>()),
    );
    gh.factory<_i1012.RecipeRepository>(
      () => _i976.RecipeRepositoryTestImpl(gh<_i703.RecipeTestingSource>()),
      registerFor: {_dev},
    );
    return this;
  }
}
