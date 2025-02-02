import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/erroe/failures.dart';
import 'package:news/features/news_screen/domain/repositories/news_repository.dart';
import 'package:news/features/news_screen/domain/entities/source_response_entity.dart';

//todo : @injectable 
@injectable
class NewsUseCase {
  NewsRepository newsRepository ;
  NewsUseCase ({required this.newsRepository});
 Future <Either<Failures , SourceResponseEntity>> invoke(String categoryId){
  return newsRepository.getAllSources(categoryId);
 }
}