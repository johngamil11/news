import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/erroe/failures.dart';
import 'package:news/features/news_screen/domain/entities/news_response_entity.dart';
import 'package:news/features/news_screen/domain/repositories/articales_repository%20.dart';

//todo : @injectable 
@injectable
class ArticalesUseCase {
  ArticalesRepository articalesRepository ;
  ArticalesUseCase ({required this.articalesRepository});
 Future <Either<Failures , NewsResponseEntity>> invoke(String sourceId){
  return articalesRepository.getAllArticales(sourceId);
 }
}