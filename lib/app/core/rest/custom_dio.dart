import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../app.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: AppEnv.i['BASE_URL'] ?? '',
            connectTimeout: Duration(
              milliseconds: int.tryParse(AppEnv.i['CONNECT_TIMEOUT'] ?? '10000') ?? 10000,
            ),
            receiveTimeout: Duration(
              milliseconds: int.tryParse(AppEnv.i['RECEIVE_TIMEOUT'] ?? '30000') ?? 30000,
            ),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }
  CustomDio auth() {
    return this;
  }

  CustomDio unAuth() {
    return this;
  }
}
