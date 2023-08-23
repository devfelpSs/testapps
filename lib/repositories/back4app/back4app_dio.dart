import 'package:dio/dio.dart';

class Back4appCustomDio {
  final _dio = Dio();

  Dio get dio => _dio;

  Back4appCustomDio(){
    _dio.options.headers["X-Parse-Application-Id"] = "162zcyYYdQIU1ZPoT8CPKWN0bmH6r33ikY9DkoZU";
    _dio.options.headers["X-Parse-REST-API-Key"] = "CwcgU5pb7yA1nCaxva7KldFl6VS0u9WAPWqIA1IR";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }
}