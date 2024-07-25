import 'package:dio/dio.dart';
import 'package:meal_ai/core/utils/logger.dart';

final smartpokeBaseOptions = BaseOptions(
  baseUrl: 'http://10.0.2.2:8082/api/',
  connectTimeout: const Duration(seconds: 2),
  receiveTimeout: const Duration(seconds: 10),
  headers: {
    'Content-Type': 'application/json; charset=UTF-8',
  },
);

final smartPokeClient = ApiClient(smartpokeBaseOptions);

class ApiClient {
  final Dio _dio;

  ApiClient(BaseOptions baseOptions) : _dio = Dio(baseOptions) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        String? token = 'token';

        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
        logger.i('Request Headers: ${options.headers}');
        logger.i('Request Data: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.i('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
        logger.i('Response Data: ${response.data}');
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        logger.e('ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
        logger.e('Error Message: ${e.message}');
        logger.e('Error Data: ${e.response?.data}');
        return handler.next(e);
      },
    ));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return await _dio.get(path, queryParameters: queryParams);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return _dio.post(path, data: data);
  }

  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParams}) async {
    return _dio.delete(path, data: data, queryParameters: queryParams);
  }

  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParams}) async {
    return _dio.put(path, data: data, queryParameters: queryParams);
  }
}