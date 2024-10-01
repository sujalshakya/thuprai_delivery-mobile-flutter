import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:thuprai_delivery/base/common/api_urls.dart';
import 'package:thuprai_delivery/base/network/error_interceptor.dart';
import 'package:thuprai_delivery/base/network/token_interceptor.dart';

class DioService {
  Dio dio = Dio(BaseOptions(baseUrl: ApiUrls.baseUrl))
    ..interceptors.addAll([
      TokenInterceptor(),
      ErrorInterceptor(),
      AwesomeDioInterceptor(
        logger: debugPrint,
        // logRequestHeaders: false,
        // logResponseHeaders: false,
        // logRequestTimeout: false,
      )
    ]);
}
