import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/core/utils/strings.dart';
import 'package:news/features/news_screen/data/data_sources/articales_data_source%20.dart';
import 'package:news/features/news_screen/data/data_sources/imp/articales_data_source_imp.dart';
import 'package:news/features/news_screen/data/data_sources/imp/news_data_source_imp.dart';
import 'package:news/features/news_screen/data/repositories_impl/articales_repostory_imp.dart';
import 'package:news/features/news_screen/data/repositories_impl/news_repostory_imp.dart';
import 'package:news/features/news_screen/domain/repositories/news_repository.dart';
import 'package:news/features/news_screen/domain/use_cases/articales_use_case%20.dart';
import 'package:news/features/news_screen/domain/use_cases/news_use_case.dart';
import 'package:news/features/news_screen/presentation/blocs/cubit/articales_cubit.dart';
import 'package:news/features/news_screen/presentation/blocs/cubit/sources_cubit.dart';
import 'package:news/features/news_screen/presentation/pages/news_screen.dart';

class AppRouter {
  late NewsUseCase newsUseCase;
  late SourcesCubit newScreenCubit;

  late ArticalesUseCase articalesUseCase;
  late ArticalesCubit articalesCubit;

  AppRouter() {
    newsUseCase = NewsUseCase(
        newsRepository: NewsRepostoryImp(
            newsDataSource: NewsDataSourceImp(apiManager: ApiManager())));
    newScreenCubit = SourcesCubit(newsUseCase: newsUseCase);

    articalesUseCase = ArticalesUseCase(
        articalesRepository: ArticalesRepostoryImp(
            articalesDataSource:
                ArticalesDataSourceImp(apiManager: ApiManager())));
    articalesCubit = ArticalesCubit(articalesUseCase: articalesUseCase);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Strings.newsScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          SourcesCubit(newsUseCase: newsUseCase),
                    ),
                    BlocProvider(
                      create: (context) => ArticalesCubit(articalesUseCase: articalesUseCase),
                    ),
                  ],
                  child: NewsScreen(),
                ));
    }
  }
}
