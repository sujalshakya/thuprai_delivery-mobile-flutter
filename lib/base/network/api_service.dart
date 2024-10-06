import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_request.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_response.dart';
import 'package:thuprai_delivery/ui/views/order_details/models/order_status_change.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST('api/login/')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET('delivery/order/{type}/')
  Future<List<Order>> getOrders(@Path("type") String type);

  @POST('delivery/order/{id}/mark-delivered/')
  Future<OrderStatusChangeResponse> markAsDelivered(@Path("id") String id);

  @POST('delivery/order/{id}/mark-returned/')
  Future<OrderStatusChangeResponse> markAsReturned(@Path("id") String id);

  @POST('delivery/order/mark-pickedup/{id}/')
  Future<OrderStatusChangeResponse> markAsPickedUp(@Path("id") String id);
}
