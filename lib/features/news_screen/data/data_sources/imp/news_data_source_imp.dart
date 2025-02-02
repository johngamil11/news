import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/api/api_constants.dart';
import 'package:news/core/api/api_manager.dart';

import 'package:news/core/erroe/failures.dart';
import 'package:news/features/news_screen/data/data_sources/news_data_source.dart';
import 'package:news/features/news_screen/data/models/news_response_Dto.dart';
import 'package:news/features/news_screen/data/models/sourceResponceDto.dart';
import 'package:news/features/news_screen/domain/entities/news_response_entity.dart';
import 'package:news/features/news_screen/domain/entities/source_response_entity.dart';

//toDo: @Injectable
@Injectable(as: NewsDataSource)
class NewsDataSourceImp implements NewsDataSource {
ApiManager apiManager ;
NewsDataSourceImp ({required this.apiManager});
  @override
  Future<Either<Failures, SourceResponseDto>> getAllSources(String categoryId) async{
 apiManager.getData(AppConstants.sourceEndPoint , categoryId: categoryId);
 
      try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          AppConstants.sourceEndPoint , categoryId: categoryId
        );

        print(' the link is : $response') ;
      //  print(response.data);

        var getSources =
        SourceResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 404) {
          return Right(getSources);
        } else {
          return Left(
              serverError(errorMessage: getSources.message??''));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'no internet connection , please try again'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  }