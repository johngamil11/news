import 'package:news/core/erroe/failures.dart';
import 'package:news/features/news_screen/domain/entities/source_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
Future <Either<Failures , SourceResponseEntity>> getAllSources (String categoryId);
}