import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future<void> onError(err, handler) async {
    super.onError(err, handler);
  }
}
