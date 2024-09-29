import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../injection_container.dart' as di;
import '../error/exceptions.dart';
import 'api_consumer.dart';
import 'app_interceptors.dart';
import 'end_points.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false;
    client.interceptors.add(di.sl<AppIntercepters>());
    if (kDebugMode) {
      client.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }
  }

  @override
  Future<CustomResponse> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters,
      );
      return _handleResponseAsJson(response);
    } on TimeoutException {
      throw NoInternetConnectionException();
    } catch (e) {
      throw const ServerException();
    }
  }

  @override
  Future<CustomResponse> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool? formDataIsEnabled = false,
  }) async {
    try {
      final response = await client.post(path,
          queryParameters: queryParameters,
          data: (formDataIsEnabled != null && formDataIsEnabled)
              ? FormData.fromMap(body!)
              : body);

      return _handleResponseAsJson(response);
    } on TimeoutException {
      throw NoInternetConnectionException();
    } catch (e) {
      throw const ServerException();
    }
  }

  @override
  Future<CustomResponse> put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.put(path, queryParameters: queryParameters, data: body);

      return _handleResponseAsJson(response);
    } on TimeoutException {
      throw NoInternetConnectionException();
    } catch (e) {
      throw const ServerException();
    }
  }

  Future<CustomResponse> _handleResponseAsJson(
      Response<dynamic> response) async {
    final responseJson = jsonDecode(response.data.toString());
    return CustomResponse(
        data: responseJson, statusCode: response.statusCode ?? 0);
  }

  @override
  Future<CustomResponse> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool? formDataIsEnabled = false,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.delete(
        path,
        data: (formDataIsEnabled != null && formDataIsEnabled && body != null)
            ? FormData.fromMap(body)
            : body,
        queryParameters: queryParameters,
      );
      return CustomResponse(data: {}, statusCode: response.statusCode ?? 0);
    } on TimeoutException {
      throw NoInternetConnectionException();
    } catch (e) {
      throw const ServerException();
    }
  }

  @override
  Future<CustomResponse> patch(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      bool? formDataIsEnabled = false}) async {
    try {
      final response = await client.request(path,
          queryParameters: queryParameters,
          options: Options(
            method: 'PATCH',
          ),
          data: (formDataIsEnabled != null && formDataIsEnabled)
              ? FormData.fromMap(body!)
              : body);
      return _handleResponseAsJson(response);
    } on TimeoutException {
      throw NoInternetConnectionException();
    } catch (e) {
      throw const ServerException();
    }
  }
}
