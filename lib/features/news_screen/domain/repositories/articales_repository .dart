import 'package:news/core/erroe/failures.dart';
import 'package:news/features/news_screen/domain/entities/news_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ArticalesRepository {
Future <Either<Failures , NewsResponseEntity>> getAllArticales (String sourceId);
}