import 'package:dio/dio.dart';
import 'package:thuprai_delivery/base/network/error_interceptor.dart';
import 'package:thuprai_delivery/base/network/token_interceptor.dart';

class DioService {
  Dio dio = Dio(BaseOptions())
    ..interceptors
        .addAll([LogInterceptor(), TokenInterceptor(), ErrorInterceptor()]);
}
