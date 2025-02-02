import 'package:dartz/dartz.dart';
import 'package:news/core/erroe/failures.dart';
import 'package:news/features/news_screen/domain/entities/source_response_entity.dart';

abstract class NewsDataSource {
  Future<Either<Failures , SourceResponseEntity>> getAllSources(String categoryId) ; 
}