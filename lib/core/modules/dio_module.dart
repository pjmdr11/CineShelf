import 'package:cine_shelf/core/constants/env_constants.dart';
import 'package:cine_shelf/data/local/env_helper.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @prod
  @dev
  @lazySingleton
  Dio dio(EnvHelper envHelper) {
    const defTimeout = 50;
    const defReceiveTimeOut = 50;

    final dio = Dio()
      ..options.baseUrl = envHelper.getEnvData(envBaseApi)
      ..options.connectTimeout = const Duration(seconds: defTimeout)
      ..options.receiveTimeout = const Duration(seconds: defReceiveTimeOut);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        CurlLoggerDioInterceptor(convertFormData: true, printOnSuccess: true),
      );
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: kDebugMode,
          error: kDebugMode,
          requestHeader: kDebugMode,
          responseHeader: kDebugMode,
          responseBody: kDebugMode,
        ),
      );
    }

    return dio;
  }
}
