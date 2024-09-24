import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:thuprai_delivery/ui/views/couriered/models/couriered_model.dart';
import 'package:thuprai_delivery/ui/views/dispatched/model/order_disptached_model.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_request.dart';
import 'package:thuprai_delivery/ui/views/login/models/login_response.dart';
import 'package:thuprai_delivery/ui/views/pending/models/pending_model.dart';
import 'package:thuprai_delivery/ui/views/picking_up/models/pickingup_model.dart';
import 'package:thuprai_delivery/ui/views/processing/models/processing_model.dart';
import 'package:thuprai_delivery/ui/views/returned/models/returned_model.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://tbe.thuprai.com/v1/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST('api/login/')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET('delivery/order/dispatched/')
  Future<List<OrderDispatch>> getDispatchedOrders();

  @GET('delivery/order/pending/')
  Future<List<Pending>> getPendingOrders();

  @GET('delivery/order/couriered/')
  Future<List<Couriered>> getCourieredOrders();

  @GET('delivery/order/picking-up/')
  Future<List<PickingUp>> getPickingUpOrders();

  @GET('delivery/order/processing/')
  Future<List<Processing>> getProcessingOrders();

  @GET('delivery/order/returned/')
  Future<List<Returned>> getReturnedOrders();
}
