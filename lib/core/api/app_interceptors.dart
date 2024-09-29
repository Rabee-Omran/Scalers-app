// ignore_for_file: deprecated_member_use
import 'dart:developer';
import 'package:dio/dio.dart';

class AppIntercepters extends Interceptor {
  final Dio client;

  AppIntercepters({required this.client});

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
