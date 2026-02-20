import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/constants/api_constants.dart';

@module
abstract class DioProvider {
  @lazySingleton
  Dio dioProvider() {
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: ApiConstants.duration),
        sendTimeout: const Duration(seconds: ApiConstants.duration),
        receiveTimeout: const Duration(seconds: ApiConstants.duration),
      ),
    );
    dio.interceptors.add(AppInterceptors());
    dio.interceptors.add(providePretty());
    return dio;
  }

  @lazySingleton
  LogInterceptor providePretty() {
    return LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      request: true,
    );
  }
}

class AppInterceptors implements Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJkNmVkM2VjOS1lOTg5LTQxZjctOWRhNC1iY2IzMzA0ZDE2YTYiLCJyb2xlIjoiVVNFUiIsInBlcm1pc3Npb25zIjpbXSwiaWF0IjoxNzcxNTQ0NzgxLCJleHAiOjE3NzIxNDk1ODF9.gEbwXTEIg0uFVnushuUWcGIq-23m53KfWMaPAoxB1VI";
    options.headers['Authorization'] = 'Bearer $token';

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
