import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/service/secure_storage_service.dart';

class TokenInterceptor extends Interceptor {
  final dio = Dio();
  final _secureStorage = locator<SecureStorageService>();

  /// Add headers to requests, include token when token is not null in secure storage.
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "Content-Type": "application/json",
    });
    final token = await _secureStorage.getToken('token');
    if (token != null) {
      options.headers.addAll({
        "Authorization": "token $token",
      });
    }

    return super.onRequest(options, handler);
  }

  /// Print status code after every api response.
  /// Save token to secure storage if response contains token.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    String res = response.toString();
    if (res.contains("token")) {
      var login = jsonDecode(response.toString());
      await _secureStorage.setToken('token', login['token']);
    }
    debugPrint(response.statusCode.toString());
    super.onResponse(response, handler);
  }
}
