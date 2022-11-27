import 'package:dio/dio.dart';

import 'app_interceptor.dart';

class NetworkDio {
  static Dio createDio({
    required bool needAuth,
  }) {
    const String baseUrl = 'https://getjadwal.api.devcode.gethired.id';

    final options = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.plain,
      connectTimeout: 60 * 2000, // 120 s
      receiveTimeout: 60 * 2000, // 120 s
    );

    Dio dio = Dio(options);
    dio.interceptors.addAll([
      AppInterceptor(dio, needAuth: needAuth),
    ]);
    return dio;
  }
}
