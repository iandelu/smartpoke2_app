import 'package:dio/dio.dart';
import 'package:meal_ai/core/utils/logger.dart';

final smartpokeBaseOptions = BaseOptions(
  baseUrl: 'http://localhost:8082/api/'
);

final smartPokeClient = ApiClient(smartpokeBaseOptions);

class ApiClient {
  final Dio _dio;

  ApiClient(BaseOptions baseOptions) : _dio = Dio();

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    String url = smartpokeBaseOptions.baseUrl + path;
    return await _dio.get(url);
  }

  Future<Response> post(String path, {dynamic data}) async {
    String url = smartpokeBaseOptions.baseUrl + path;
    return _dio.post(url, data: data);
  }

  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParams}) async {
    String url = smartpokeBaseOptions.baseUrl + path;
    return _dio.delete(url, data: data, queryParameters: queryParams);
  }

  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParams}) async {
    String url = smartpokeBaseOptions.baseUrl + path;
    return _dio.put(url, data: data, queryParameters: queryParams);
  }
}