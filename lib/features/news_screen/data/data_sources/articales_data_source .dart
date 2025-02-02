import 'package:dartz/dartz.dart';
import 'package:news/core/erroe/failures.dart';
import 'package:news/features/news_screen/domain/entities/news_response_entity.dart';
import 'package:news/features/news_screen/domain/entities/source_response_entity.dart';

abstract class ArticalesDataSource {
  Future<Either<Failures , NewsResponseEntity>> getAllArticales(String sourceId) ; 
}