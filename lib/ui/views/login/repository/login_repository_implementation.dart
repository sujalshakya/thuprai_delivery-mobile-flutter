import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_request.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_response.dart';
import 'package:thuprai_delivery/ui/views/login/service/login_service.dart';

class LoginRepositoryImplementation {
  final _loginService = locator<LoginService>();
  Future<LoginResponse> loginApiRequest(email, password) async {
    LoginRequest loginRequest =
        LoginRequest(username: email, password: password);
    return await _loginService.loginApiRequest(loginRequest);
  }
}
