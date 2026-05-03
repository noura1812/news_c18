// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/main_layer/data/data_source/main_layer_data_source.dart'
    as _i450;
import '../../features/main_layer/data/data_source/network_data_source.dart'
    as _i185;
import '../../features/main_layer/data/repository/main_layer_repository_impl.dart'
    as _i955;
import '../../features/main_layer/domain/repository/main_layer_repository.dart'
    as _i219;
import '../../features/main_layer/domain/usecases/get_articles_usecase.dart'
    as _i975;
import '../../features/main_layer/domain/usecases/get_resources_usecase.dart'
    as _i880;
import '../../features/main_layer/presntation/view_model/cubit/cubit/main_layer_cubit.dart'
    as _i797;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i450.MainLayerDataSource>(
      () => _i185.MainLayerNetworkDataSource(),
    );
    gh.factory<_i219.MainLayerRepository>(
      () => _i955.MainLayerRepositoryImpl(gh<_i450.MainLayerDataSource>()),
    );
    gh.factory<_i975.GetArticlesUsecase>(
      () => _i975.GetArticlesUsecase(
        mainLayerRepository: gh<_i219.MainLayerRepository>(),
      ),
    );
    gh.factory<_i880.GetResourcesUsecase>(
      () => _i880.GetResourcesUsecase(
        mainLayerRepository: gh<_i219.MainLayerRepository>(),
      ),
    );
    gh.factory<_i797.MainLayerCubit>(
      () => _i797.MainLayerCubit(
        gh<_i975.GetArticlesUsecase>(),
        gh<_i880.GetResourcesUsecase>(),
      ),
    );
    return this;
  }
}
