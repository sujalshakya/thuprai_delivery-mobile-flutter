import 'package:thuprai_delivery/ui/views/login/models/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> login();
}
