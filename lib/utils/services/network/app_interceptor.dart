import 'dart:developer';

import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  Dio refreshDio = Dio();
  bool needAuth;
  Dio previous;
  AppInterceptor(
    this.previous, {
    this.needAuth = false,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log('REQUEST[${options.method}] => PATH: ${options.path}');

    if (needAuth) {
      String accessToken = '';
      log('access Token: $accessToken');
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    if (options.data != null) {
      if (options.data is! FormData) {
        options.headers["Content-Type"] = "application/json";
      }
    } else {
      options.headers["Content-Type"] = "application/json";
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    // if (err.response?.statusCode == 401) {
    //   logout();
    // }
    return super.onError(err, handler);
  }
}
