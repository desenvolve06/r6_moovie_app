import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  static Future<Dio> getDio() async {
    await dotenv.load(fileName: ".env");

    final dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final apiKey = dotenv.env['API_KEY'];

          if (apiKey != null) {
            options.queryParameters['api_key'] = apiKey;
          } else {
            throw Exception('API key not found in .env file');
          }

          return handler.next(options);
        },
      ),
    );
    return dio;
  }
}
