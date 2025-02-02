// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/news_screen/data/data_sources/articales_data_source%20.dart'
    as _i38;
import '../features/news_screen/data/data_sources/imp/articales_data_source_imp.dart'
    as _i60;
import '../features/news_screen/data/data_sources/imp/news_data_source_imp.dart'
    as _i695;
import '../features/news_screen/data/data_sources/news_data_source.dart'
    as _i1014;
import '../features/news_screen/data/repositories_impl/articales_repostory_imp.dart'
    as _i1061;
import '../features/news_screen/data/repositories_impl/news_repostory_imp.dart'
    as _i537;
import '../features/news_screen/domain/repositories/articales_repository%20.dart'
    as _i834;
import '../features/news_screen/domain/repositories/news_repository.dart'
    as _i285;
import '../features/news_screen/domain/use_cases/articales_use_case%20.dart'
    as _i203;
import '../features/news_screen/domain/use_cases/news_use_case.dart' as _i514;
import 'api/api_manager.dart' as _i673;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i673.ApiManager>(() => _i673.ApiManager());
    gh.factory<_i38.ArticalesDataSource>(
        () => _i60.ArticalesDataSourceImp(apiManager: gh<_i673.ApiManager>()));
    gh.factory<_i1014.NewsDataSource>(
        () => _i695.NewsDataSourceImp(apiManager: gh<_i673.ApiManager>()));
    gh.factory<_i834.ArticalesRepository>(() => _i1061.ArticalesRepostoryImp(
        articalesDataSource: gh<_i38.ArticalesDataSource>()));
    gh.factory<_i285.NewsRepository>(() =>
        _i537.NewsRepostoryImp(newsDataSource: gh<_i1014.NewsDataSource>()));
    gh.factory<_i203.ArticalesUseCase>(() => _i203.ArticalesUseCase(
        articalesRepository: gh<_i834.ArticalesRepository>()));
    gh.factory<_i514.NewsUseCase>(
        () => _i514.NewsUseCase(newsRepository: gh<_i285.NewsRepository>()));
    return this;
  }
}
