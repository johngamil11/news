//todo : @Injectable 
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/erroe/failures.dart';
import 'package:news/features/news_screen/data/data_sources/news_data_source.dart';
import 'package:news/features/news_screen/domain/entities/news_response_entity.dart';
import 'package:news/features/news_screen/domain/repositories/news_repository.dart';
import 'package:news/features/news_screen/domain/entities/source_response_entity.dart';
@Injectable(as: NewsRepository)
class NewsRepostoryImp implements NewsRepository {
NewsDataSource newsDataSource ; 
NewsRepostoryImp({required this.newsDataSource});

Future<Either<Failures , SourceResponseEntity>> getAllSources (String categoryId) async {
  var either = await newsDataSource.getAllSources(categoryId);
  return either.fold((error) => Left(error), (response)=> Right(response));
}

}