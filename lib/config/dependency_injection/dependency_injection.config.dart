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
import 'package:recipe_haven/core/data/repositories/recipe_repository_firebase_impl.dart'
    as _i445;
import 'package:recipe_haven/core/data/repositories/recipe_repository_test_impl.dart'
    as _i717;
import 'package:recipe_haven/core/home/presentation/get_creators_cubit/get_creators_cubit.dart'
    as _i284;
import 'package:recipe_haven/core/home/presentation/get_recipes_cubit/get_recipes_cubit.dart'
    as _i786;
import 'package:recipe_haven/core/home/presentation/get_tags_cubit/get_tags_cubit.dart'
    as _i275;
import 'package:recipe_haven/core/home/presentation/get_tonight_cook_cubit/get_tonight_cook_cubit.dart'
    as _i756;
import 'package:recipe_haven/core/services/animation/animation_service.dart'
    as _i726;
import 'package:recipe_haven/core/services/animation/animation_service_auto_animate_service_impl.dart'
    as _i1027;
import 'package:recipe_haven/core/services/cache/hive_cache_service.dart'
    as _i916;
import 'package:recipe_haven/core/services/cache/hive_module.dart' as _i640;
import 'package:recipe_haven/core/services/image/network_image_service.dart'
    as _i779;
import 'package:recipe_haven/core/services/image/network_image_service_cached_image_impl.dart'
    as _i620;
import 'package:recipe_haven/features/recipe_review/data/models/reviewer_model.dart'
    as _i864;
import 'package:recipe_haven/features/recipe_review/data/models/sub_review_model.dart'
    as _i803;
import 'package:recipe_haven/features/recipe_review/data/repositories/cache_repositories/reviewers_cache_service.dart'
    as _i494;
import 'package:recipe_haven/features/recipe_review/data/repositories/cache_repositories/sub_reviews_cache_service.dart'
    as _i815;
import 'package:recipe_haven/features/recipe_review/data/repositories/recipe_upload_files_repository_test_impl.dart'
    as _i582;
import 'package:recipe_haven/features/recipe_review/data/repositories/review_repository_firebase_impl.dart'
    as _i611;
import 'package:recipe_haven/features/recipe_review/data/repositories/review_repository_test_impl.dart'
    as _i765;
import 'package:recipe_haven/features/recipe_review/data/repositories/upload_review_images_supabase_impl.dart'
    as _i567;
import 'package:recipe_haven/features/recipe_review/domain/repositories/repositories.dart'
    as _i439;
import 'package:recipe_haven/features/recipe_review/domain/repositories/review_repository.dart'
    as _i1018;
import 'package:recipe_haven/features/recipe_review/domain/repositories/upload_review_images_repository.dart'
    as _i150;
import 'package:recipe_haven/features/recipe_review/presentation/create_review_bloc/create_review_bloc.dart'
    as _i373;
import 'package:recipe_haven/features/recipe_review/presentation/get_reviews_data_bloc/get_reviews_data_bloc.dart'
    as _i704;
import 'package:recipe_haven/features/recipe_review/presentation/providers/reviews_temp_data_provider.dart'
    as _i882;
import 'package:recipe_haven/features/user/data/repositories/user_repository_firebase_impl.dart'
    as _i280;
import 'package:recipe_haven/features/user/data/repositories/user_repository_test_impl.dart'
    as _i445;
import 'package:recipe_haven/features/user/domain/repositories/repositories.dart'
    as _i531;
import 'package:recipe_haven/features/user/domain/repositories/user_repository.dart'
    as _i214;
import 'package:recipe_haven/features/user/presentation/state_management/bloc/user_bloc.dart'
    as _i980;
import 'package:recipe_haven/features/user/presentation/state_management/providers/form_provider.dart'
    as _i708;
import 'package:recipe_haven/features/view_recipe/domain/repositories/recipe_repository.dart'
    as _i893;
import 'package:recipe_haven/features/view_recipe/presentation/recipe_info_bloc/recipe_info_bloc.dart'
    as _i588;
import 'package:recipe_haven/features/view_recipe/view_recipe.dart' as _i636;

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
    await gh.singletonAsync<_i916.HiveCacheService<_i864.ReviewerModel>>(
      () => hiveModule.provideReviewersBox(),
      preResolve: true,
    );
    await gh.singletonAsync<_i916.HiveCacheService<_i803.SubReviewModel>>(
      () => hiveModule.provideSubReviewsBox(),
      preResolve: true,
    );
    gh.lazySingleton<_i588.RecipeInfoBloc>(() => _i588.RecipeInfoBloc());
    gh.lazySingleton<_i708.FormProvider>(() => _i708.FormProvider());
    gh.lazySingleton<_i882.ReviewsTempDataProvider<dynamic>>(
      () => _i882.ReviewsTempDataProvider<dynamic>(),
    );
    gh.factory<_i726.AnimationService>(() => _i1027.AutoAnimateServiceImpl());
    gh.factory<_i214.UserRepository>(
      () => _i280.UserRepositoryFirebaseImpl(),
      registerFor: {_prod},
    );
    gh.factory<_i214.UserRepository>(
      () => _i445.UserRepositoryTestImpl(),
      registerFor: {_dev},
    );
    gh.factory<_i636.RecipeRepository>(
      () => _i445.RecipeRepositoryFirebaseImpl(gh<_i1018.ReviewRepository>()),
      registerFor: {_prod},
    );
    gh.factory<_i636.RecipeRepository>(
      () => _i717.RecipeRepositoryTestImpl(),
      registerFor: {_dev},
    );
    gh.factory<_i150.UploadReviewImagesRepository>(
      () => _i567.UploadReviewImagesSupabaseImpl(),
      registerFor: {_prod},
    );
    gh.factory<_i150.UploadReviewImagesRepository>(
      () => _i582.RecipeUploadFilesRepositoryTestImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i284.GetCreatorsCubit>(
      () => _i284.GetCreatorsCubit(gh<_i214.UserRepository>()),
    );
    await gh.factoryAsync<_i494.ReviewersCacheService>(
      () => hiveModule.provideReviewersCache(
        gh<_i916.HiveCacheService<_i864.ReviewerModel>>(),
      ),
      preResolve: true,
    );
    await gh.factoryAsync<_i815.SubReviewsCacheService>(
      () => hiveModule.provideSubReviewsCache(
        gh<_i916.HiveCacheService<_i803.SubReviewModel>>(),
      ),
      preResolve: true,
    );
    gh.singleton<_i980.UserBloc>(
      () => _i980.UserBloc(gh<_i531.UserRepository>()),
    );

    gh.factory<_i439.ReviewRepository>(
      () => _i765.ReviewRepositoryTestImpl(),
      registerFor: {_dev},
    );
    gh.factory<_i779.NetworkImageService>(
      () => _i620.NetworkImageServiceCachedImageImpl(),
    );

    gh.factory<_i1018.ReviewRepository>(
      () => _i611.ReviewRepositoryFirebaseImpl(
        gh<_i815.SubReviewsCacheService>(),
        gh<_i494.ReviewersCacheService>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i756.GetTonightCookCubit>(
      () => _i756.GetTonightCookCubit(gh<_i893.RecipeRepository>()),
    );
    gh.singleton<_i275.GetTagsCubit>(
      () => _i275.GetTagsCubit(gh<_i893.RecipeRepository>()),
    );
    gh.singleton<_i786.GetRecipesCubit>(
      () => _i786.GetRecipesCubit(gh<_i636.RecipeRepository>()),
    );
    gh.lazySingleton<_i704.GetReviewsDataBloc>(
      () => _i704.GetReviewsDataBloc(gh<_i1018.ReviewRepository>()),
    );
    gh.lazySingleton<_i373.CreateReviewBloc>(
      () => _i373.CreateReviewBloc(
        gh<_i439.ReviewRepository>(),
        gh<_i439.UploadReviewImagesRepository>(),
        gh<_i882.ReviewsTempDataProvider<dynamic>>(),
      ),
    );
    return this;
  }
}

class _$HiveModule extends _i640.HiveModule {}
