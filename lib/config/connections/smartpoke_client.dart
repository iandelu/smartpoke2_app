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
    try {
      return await _dio.get(url);
    } catch (e, stackTrace) {
      logger.e("GET request failed",error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    String url = smartpokeBaseOptions.baseUrl + path;
    try {
      return await _dio.post(url, data: data);
    } catch (e, stackTrace) {
      logger.e("POST request failed",error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParams}) async {
    String url = smartpokeBaseOptions.baseUrl + path;
    try {
      return await _dio.delete(url, data: data, queryParameters: queryParams);
    } catch (e, stackTrace) {
      logger.e("DELETE request failed",error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParams}) async {
    String url = smartpokeBaseOptions.baseUrl + path;
    try {
      return await _dio.put(url, data: data, queryParameters: queryParams);
    } catch (e, stackTrace) {
      logger.e("PUT request failed", error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}