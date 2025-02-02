import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:news/core/erroe/failures.dart';
import 'package:news/features/news_screen/domain/entities/news_response_entity.dart';
import 'package:news/features/news_screen/domain/use_cases/articales_use_case%20.dart';

part 'articales_state.dart';

class ArticalesCubit extends Cubit<ArticalesState> {
  ArticalesUseCase articalesUseCase ;
  List<ArticlesEntity>? articles ;
  ArticalesCubit({required this.articalesUseCase}) : super(ArticalesInitial());

 void getArticles(String sourceId)async{
    emit(ArticalesLoading()); // 🟢 إظهار Loading أثناء الجلب
  emit(ArticalesLoaded(articles: [])); // 🔴 حذف المقالات القديمة قبل التحديث

    emit(ArticalesLoading());
    var either = await articalesUseCase.invoke(sourceId);
    either.fold((error){
      print(error.errorMessage);
      emit(ArticalesError(failures: error));
    }, (response){
      articles = response.articles ;
      print(articles);
        emit(ArticalesLoaded(articles: articles));
      });
  }


}
