import 'package:consult_app/dependency_injection/di.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/constants/api_constants.dart';
import '../../../core/caching/cache_keys.dart';
import '../../../core/caching/secure_storge/caching_Data.dart';

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
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token = await getIt.get<CachingDataSecureStorage>().readData(
      key: CacheKeys.token,
    );

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
