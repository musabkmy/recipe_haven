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

import '../../core/animation/animation_service.dart' as _i644;
import '../../core/animation/animation_service_auto_animate_service_impl.dart'
    as _i513;
import '../../core/data/mocking_sources/recipe_mock_source.dart' as _i779;
import '../../core/data/mocking_sources/user_mock_source.dart' as _i430;
import '../../core/data/repositories/recipe_repository_firebase_impl.dart'
    as _i766;
import '../../core/data/repositories/recipe_repository_test_impl.dart' as _i650;
import '../../core/home/presentation/get_creators_cubit/get_creators_cubit.dart'
    as _i579;
import '../../core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart'
    as _i414;
import '../../core/home/presentation/get_tags_cubit/get_tags_cubit.dart'
    as _i296;
import '../../core/home/presentation/get_tonight_cook_cubit/get_tonight_cook_cubit.dart'
    as _i1048;
import '../../features/recipe/domain/repositories/recipe_repository.dart'
    as _i76;
import '../../features/recipe/presentation/blocs/recipe_info_bloc/recipe_info_bloc.dart'
    as _i220;
import '../../features/recipe/recipe.dart' as _i1012;
import '../../features/user/data/repositories/user_repository_firebase_impl.dart'
    as _i431;
import '../../features/user/data/repositories/user_repository_test_impl.dart'
    as _i890;
import '../../features/user/domain/repositories/repositories.dart' as _i587;
import '../../features/user/domain/repositories/user_repository.dart' as _i237;
import '../../features/user/presentation/state_management/bloc/user_bloc.dart'
    as _i809;
import '../../features/user/presentation/state_management/providers/form_provider.dart'
    as _i307;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i430.UserMockSource>(() => _i430.UserMockSource());
    gh.singleton<_i779.RecipeMockSource>(() => _i779.RecipeMockSource());
    gh.singleton<_i220.RecipeInfoBloc>(() => _i220.RecipeInfoBloc());
    gh.singleton<_i307.FormProvider>(() => _i307.FormProvider());
    gh.factory<_i644.AnimationService>(() => _i513.AutoAnimateServiceImpl());
    gh.factory<_i237.UserRepository>(
      () => _i890.UserRepositoryTestImpl(gh<_i430.UserMockSource>()),
      registerFor: {_dev},
    );
    gh.factory<_i1012.RecipeRepository>(
      () => _i650.RecipeRepositoryTestImpl(gh<_i779.RecipeMockSource>()),
      registerFor: {_dev},
    );
    gh.factory<_i237.UserRepository>(
      () => _i431.UserRepositoryFirebaseImpl(),
      registerFor: {_prod},
    );
    gh.factory<_i1012.RecipeRepository>(
      () => _i766.RecipeRepositoryFirebaseImpl(),
      registerFor: {_prod},
    );
    gh.singleton<_i579.GetCreatorsCubit>(
      () => _i579.GetCreatorsCubit(gh<_i237.UserRepository>()),
    );
    gh.singleton<_i809.UserBloc>(
      () => _i809.UserBloc(gh<_i587.UserRepository>()),
    );
    gh.singleton<_i1048.GetTonightCookCubit>(
      () => _i1048.GetTonightCookCubit(gh<_i76.RecipeRepository>()),
    );
    gh.singleton<_i296.GetTagsCubit>(
      () => _i296.GetTagsCubit(gh<_i76.RecipeRepository>()),
    );
    gh.singleton<_i414.GetRecipesCubit>(
      () => _i414.GetRecipesCubit(gh<_i1012.RecipeRepository>()),
    );
    return this;
  }
}
