import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';

class CourieredRepositoryImplementation {
  final _apiService = locator<ApiService>();

  Future<List<Order>> getCourieredOrders() async {
    try {
      return await _apiService.getCourieredOrders();
    } on DioException {
      rethrow;
    }
  }
}
