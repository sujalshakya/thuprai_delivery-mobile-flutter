import 'package:flutter/material.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/network/retrofit_service.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_response.dart';

class LoginService {
  final _retrofitService = locator<RetrofitService>();

  Future<LoginResponse> loginApiRequest(loginRequest) async {
    try {
      return await _retrofitService.login(loginRequest);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
