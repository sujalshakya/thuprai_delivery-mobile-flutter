import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';

class OrderRepositoryImplementation {
  final _apiService = locator<ApiService>();

  Future<List<Order>> getOrders(String type) async {
    try {
      return await _apiService.getOrders(type);
    } on DioException {
      rethrow;
    }
  }
}
