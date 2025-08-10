import 'package:cine_shelf/core/constants/env_constants.dart';
import 'package:cine_shelf/data/local/env_helper.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  final Dio dio;
  final EnvHelper envHelper;

  ApiService({required this.dio, required this.envHelper});

  Map<String, dynamic> getAppHeaders() {
    return {"Authorization": "Bearer ${envHelper.getEnvData(envApiKey)}"};
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      return await dio.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> post(
    String url,
    dynamic data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dio.post(
        url,
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> put(
    String url,
    dynamic data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dio.put(
        url,
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> delete(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      return await dio.delete(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> patch(
    String url,
    dynamic data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dio.patch(
        url,
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
      );
    } catch (_) {
      rethrow;
    }
  }
}
