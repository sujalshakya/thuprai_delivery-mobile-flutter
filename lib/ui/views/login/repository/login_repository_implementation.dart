import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_request.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_response.dart';

class LoginRepositoryImplementation {
  final _apiService = locator<ApiService>();
  Future<LoginResponse> loginApiRequest(email, password) async {
    LoginRequest loginRequest =
        LoginRequest(username: email, password: password);
    try {
      return await _apiService.login(loginRequest);
    } on DioException catch (e) {
      throw e.response!.data['non_field_errors'][0];
    }
  }
}
