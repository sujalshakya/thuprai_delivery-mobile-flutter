import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_request.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_response.dart';
part 'retrofit_service.g.dart';

@RestApi(baseUrl: "https://tbe.thuprai.com/v1/api")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST('/login/')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
