import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_request.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_response.dart';
import 'package:thuprai_delivery/ui/views/picking_up/models/picking_up_model.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST('api/login/')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET('delivery/order/dispatched/')
  Future<List<Order>> getDispatchedOrders();

  @GET('delivery/order/pending/')
  Future<List<Order>> getPendingOrders();

  @GET('delivery/order/couriered/')
  Future<List<Order>> getCourieredOrders();

  @GET('delivery/order/picking-up/')
  Future<List<PickingUp>> getPickingUpOrders();

  @GET('delivery/order/processing/')
  Future<List<Order>> getProcessingOrders();

  @GET('delivery/order/returned/')
  Future<List<Order>> getReturnedOrders();
}
