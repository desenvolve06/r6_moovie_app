import 'package:dio/dio.dart';

class ApiClient {
  static Dio getDio() {
    final dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
            const apiKey = 'PUT KEY';
          options.queryParameters['api_key'] = apiKey;
          return handler.next(options);
        },
      ),
    );
    return dio;
  }
}
