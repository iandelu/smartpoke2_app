import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:meal_ai/core/utils/logger.dart';

final smartpokeBaseOptions = BaseOptions(
    baseUrl: 'http://localhost:8082/api/'
);

final smartPokeClient = ApiClient(smartpokeBaseOptions);

class ApiClient {
  final Dio _dio;

  ApiClient(BaseOptions baseOptions) : _dio = Dio(baseOptions);

  Future<String?> _getJwt() async {
    final box = await Hive.openBox('authBox');
    return box.get('JWT_KEY');
  }

  Future<Options> _getOptions(bool authenticated) async {
    Options options = Options();
    if (authenticated) {
      final jwt = await _getJwt();
      if (jwt != null) {
        options.headers = {'Authorization': 'Bearer $jwt'};
      }
    }
    return options;
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams, bool authenticated = false}) async {
    String url = smartpokeBaseOptions.baseUrl + path;
    try {
      return await _dio.get(url, queryParameters: queryParams, options: await _getOptions(authenticated));
    } catch (e, stackTrace) {
      logger.e("GET request failed", error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Response> post(String path, {dynamic data, bool authenticated = false}) async {
    String url = smartpokeBaseOptions.baseUrl + path;
    try {
      return await _dio.post(url, data: data, options: await _getOptions(authenticated));
    } catch (e, stackTrace) {
      logger.e("POST request failed", error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParams, bool authenticated = false}) async {
    String url = smartpokeBaseOptions.baseUrl + path;
    try {
      return await _dio.delete(url, data: data, queryParameters: queryParams, options: await _getOptions(authenticated));
    } catch (e, stackTrace) {
      logger.e("DELETE request failed", error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParams, bool authenticated = false}) async {
    String url = smartpokeBaseOptions.baseUrl + path;
    try {
      return await _dio.put(url, data: data, queryParameters: queryParams, options: await _getOptions(authenticated));
    } catch (e, stackTrace) {
      logger.e("PUT request failed", error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}