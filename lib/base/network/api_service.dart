import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_request.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_response.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST('api/login/')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET('delivery/order/{type}/')
  Future<List<Order>> getOrders(@Path("type") String type);
}
