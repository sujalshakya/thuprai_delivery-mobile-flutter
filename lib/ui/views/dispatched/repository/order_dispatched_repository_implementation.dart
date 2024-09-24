import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';
import 'package:thuprai_delivery/ui/views/dispatched/model/order_disptached_model.dart';

class OrderDispatchedRepositoryImplementation {
  final _apiService = locator<ApiService>();

  Future<List<OrderDispatch>> getDispatchedOrders() async {
    try {
      return await _apiService.getDispatchedOrders();
    } on DioException catch (e) {
      rethrow;
    }
  }
}
