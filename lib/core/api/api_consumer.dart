class CustomResponse {
  final dynamic data;
  final int statusCode;

  CustomResponse({required this.data, required this.statusCode});
}

abstract class ApiConsumer {
  Future<CustomResponse> get(String path,
      {Map<String, dynamic>? queryParameters});
  Future<CustomResponse> post(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      bool? formDataIsEnabled = false});
  Future<CustomResponse> put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters});
  Future<CustomResponse> delete(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      bool? formDataIsEnabled = false});
  Future<CustomResponse> patch(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      bool? formDataIsEnabled = false});
}
