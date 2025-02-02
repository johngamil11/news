
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news/core/api/api_constants.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint,
      {String? categoryId, String? sourceId , Map<String, dynamic>? headers, Map<String, dynamic>? body , String? query , String? language}) {
    return dio.get(AppConstants.baseUrl + endPoint ,
        data: body,
        queryParameters: {
          'q' : sourceId ,
          'category' : categoryId,
      'apikey' :'42c8fa7b7a38410aa9a43835c4039204' ,
    //  'apikey' :'1986e986f5544827b563db2a6dd0d2a8' ,
          'language' :'en'

        },
        options: Options(headers: headers, validateStatus: (status) => true));
  }

  // Future<Response> getData2(String endPoint ,String sourceId ,
  //     {Map<String, dynamic>? headers, Map<String, dynamic>? body , String? query , String? language}) {
  //   return dio.get(AppConstants.baseUrl + endPoint ,
  //       data: body,
  //       queryParameters: {
  //     'q':sourceId ,
  //     'apikey' :'42c8fa7b7a38410aa9a43835c4039204' ,
  //    // 'apikey' :'1986e986f5544827b563db2a6dd0d2a8' ,
  //     'language' :'en'
  //       },
  //       options: Options(headers: headers, validateStatus: (status) => true));
  // }


  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body}) {
    return dio.post(AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: headers, validateStatus: (status) => true));
  }

  Future<Response> deleteData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body}) {
    return dio.delete(AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: headers, validateStatus: (status) => true));
  }

  Future<Response> updateData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body}) {
    return dio.put(AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: headers, validateStatus: (status) => true));
  }
}

