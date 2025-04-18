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
import '../../core/services/animation/animation_service.dart' as _i121;
import '../../core/services/animation/animation_service_auto_animate_service_impl.dart'
    as _i382;
import '../../core/services/cache/hive_cache_service.dart' as _i109;
import '../../core/services/cache/hive_module.dart' as _i93;
import '../../core/services/image/network_image_service.dart' as _i952;
import '../../core/services/image/network_image_service_cached_image_impl.dart'
    as _i830;
import '../../features/recipe_review/data/models/reviewer_model.dart' as _i814;
import '../../features/recipe_review/data/repositories/recipe_upload_files_repository_test_impl.dart'
    as _i659;
import '../../features/recipe_review/data/repositories/review_repository_firebase_impl.dart'
    as _i613;
import '../../features/recipe_review/data/repositories/review_repository_test_impl.dart'
    as _i57;
import '../../features/recipe_review/data/repositories/reviewers_cache_service.dart'
    as _i956;
import '../../features/recipe_review/data/repositories/upload_review_images_supabase_impl.dart'
    as _i656;
import '../../features/recipe_review/domain/repositories/repositories.dart'
    as _i735;
import '../../features/recipe_review/domain/repositories/review_repository.dart'
    as _i149;
import '../../features/recipe_review/domain/repositories/upload_review_images_repository.dart'
    as _i935;
import '../../features/recipe_review/presentation/create_review_bloc/create_review_bloc.dart'
    as _i468;
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
import '../../features/view_recipe/domain/repositories/recipe_repository.dart'
    as _i208;
import '../../features/view_recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart'
    as _i907;
import '../../features/view_recipe/view_recipe.dart' as _i1062;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final hiveModule = _$HiveModule();
    await gh.factoryAsync<_i109.HiveCacheService<_i814.ReviewerModel>>(
      () => hiveModule.provideReviewerCache(),
      preResolve: true,
    );
    gh.singleton<_i430.UserMockSource>(() => _i430.UserMockSource());
    gh.singleton<_i779.RecipeMockSource>(() => _i779.RecipeMockSource());
    gh.singleton<_i307.FormProvider>(() => _i307.FormProvider());
    gh.lazySingleton<_i907.RecipeInfoBloc>(() => _i907.RecipeInfoBloc());
    gh.factory<_i121.AnimationService>(() => _i382.AutoAnimateServiceImpl());
    gh.factory<_i935.UploadReviewImagesRepository>(
      () => _i659.RecipeUploadFilesRepositoryTestImpl(),
      registerFor: {_dev},
    );
    await gh.factoryAsync<_i956.ReviewersCacheService>(
      () => hiveModule.provideReviewersCache(
        gh<_i109.HiveCacheService<_i814.ReviewerModel>>(),
      ),
      preResolve: true,
    );
    gh.factory<_i1062.RecipeRepository>(
      () =>
          _i766.RecipeRepositoryFirebaseImpl(gh<_i956.ReviewersCacheService>()),
      registerFor: {_prod},
    );
    gh.factory<_i735.ReviewRepository>(
      () => _i57.ReviewRepositoryTestImpl(),
      registerFor: {_dev},
    );
    gh.factory<_i952.NetworkImageService>(
      () => _i830.NetworkImageServiceCachedImageImpl(),
    );
    gh.factory<_i935.UploadReviewImagesRepository>(
      () => _i656.UploadReviewImagesSupabaseImpl(),
      registerFor: {_prod},
    );
    gh.factory<_i149.ReviewRepository>(
      () => _i613.ReviewRepositoryFirebaseImpl(),
      registerFor: {_prod},
    );
    gh.factory<_i237.UserRepository>(
      () => _i890.UserRepositoryTestImpl(gh<_i430.UserMockSource>()),
      registerFor: {_dev},
    );
    gh.factory<_i1062.RecipeRepository>(
      () => _i650.RecipeRepositoryTestImpl(gh<_i779.RecipeMockSource>()),
      registerFor: {_dev},
    );
    gh.factory<_i237.UserRepository>(
      () => _i431.UserRepositoryFirebaseImpl(),
      registerFor: {_prod},
    );
    gh.singleton<_i1048.GetTonightCookCubit>(
      () => _i1048.GetTonightCookCubit(gh<_i208.RecipeRepository>()),
    );
    gh.singleton<_i296.GetTagsCubit>(
      () => _i296.GetTagsCubit(gh<_i208.RecipeRepository>()),
    );
    gh.singleton<_i414.GetRecipesCubit>(
      () => _i414.GetRecipesCubit(gh<_i1062.RecipeRepository>()),
    );
    gh.singleton<_i579.GetCreatorsCubit>(
      () => _i579.GetCreatorsCubit(gh<_i237.UserRepository>()),
    );
    gh.lazySingleton<_i468.CreateReviewBloc>(
      () => _i468.CreateReviewBloc(
        gh<_i735.ReviewRepository>(),
        gh<_i735.UploadReviewImagesRepository>(),
      ),
    );
    gh.singleton<_i809.UserBloc>(
      () => _i809.UserBloc(gh<_i587.UserRepository>()),
    );
    return this;
  }
}

class _$HiveModule extends _i93.HiveModule {}
