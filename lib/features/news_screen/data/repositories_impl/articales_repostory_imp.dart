//todo : @Injectable 
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/erroe/failures.dart';
import 'package:news/features/news_screen/data/data_sources/articales_data_source%20.dart';
import 'package:news/features/news_screen/data/data_sources/news_data_source.dart';
import 'package:news/features/news_screen/domain/entities/news_response_entity.dart';
import 'package:news/features/news_screen/domain/repositories/articales_repository%20.dart';
import 'package:news/features/news_screen/domain/repositories/news_repository.dart';
import 'package:news/features/news_screen/domain/entities/source_response_entity.dart';
@Injectable(as: ArticalesRepository)

class ArticalesRepostoryImp implements ArticalesRepository {
ArticalesDataSource articalesDataSource ; 
ArticalesRepostoryImp({required this.articalesDataSource});

  @override
  Future<Either<Failures, NewsResponseEntity>> getAllArticales(String sourceId) async {
var either = await articalesDataSource.getAllArticales(sourceId);
  return either.fold((error) => Left(error), (response)=> Right(response));
  }

}