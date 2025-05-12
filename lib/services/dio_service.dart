// ignore_for_file: body_might_complete_normally_catch_error

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {
  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-type'] = "application/json";

    return await dio
        .get(
          url,
          options: Options(responseType: ResponseType.json, method: "GET"),
        )
        .then((response) {
          return response;
        }).catchError((err) {
          if(err is DioException){
            return err.response!;
          }
        });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-type'] = 'application/json';
    //TODO: read token from storage

    return await dio
        .post(
          url,
          data: dio_service.FormData.fromMap(map),
          options: Options(responseType: ResponseType.json, method: "POST"),
        )
        .then((response) {
          return response;
        }).catchError((err) {
          if(err is DioException){
            return err.response!;
          }
        });
  }
}
