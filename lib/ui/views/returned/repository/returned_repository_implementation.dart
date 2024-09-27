import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';

class ReturnedRepositoryImplementation {
  final _apiService = locator<ApiService>();

  Future<List<Order>> getProcessingOrders() async {
    try {
      return await _apiService.getReturnedOrders();
    } on DioException {
      rethrow;
    }
  }
}
