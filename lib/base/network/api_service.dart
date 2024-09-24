import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:thuprai_delivery/ui/views/dispatched/model/order_disptached_model.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_request.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://tbe.thuprai.com/v1/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST('api/login/')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET('delivery/order/dispatched/')
  Future<OrderDispatch> getDispatchedOrders();

  @GET('delivery/order/pending/')
  Future<OrderDispatch> getPendingOrders();

  @GET('delivery/order/couriered/')
  Future<OrderDispatch> getCourieredOrders();

  @GET('delivery/order/picking-up/')
  Future<OrderDispatch> getPinkingUpOrders();

  @GET('delivery/order/processing/')
  Future<OrderDispatch> getProcessingOrders();

  @GET('delivery/order/returned/')
  Future<OrderDispatch> getReturnedOrders();
}
