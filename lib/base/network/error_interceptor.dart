import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future<void> onError(err, handler) async {
    handler.next(err);
    super.onError(err, handler);
  }
}
