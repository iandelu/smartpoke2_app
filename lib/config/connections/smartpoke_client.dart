import 'package:dio/dio.dart';
import 'package:meal_ai/core/utils/logger.dart';

final smartpokeBaseOptions = BaseOptions(
  baseUrl: 'http://127.0.0.1:8082/api/',
  connectTimeout: const Duration(seconds: 20),
  receiveTimeout: const Duration(seconds: 100),
  headers: {
    'Content-Type': 'application/json; charset=UTF-8',
  },
);

final smartPokeClient = ApiClient(smartpokeBaseOptions);

class ApiClient {
  final Dio _dio;

  ApiClient(BaseOptions baseOptions) : _dio = Dio(baseOptions);

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