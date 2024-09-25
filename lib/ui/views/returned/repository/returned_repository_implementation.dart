import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';
import 'package:thuprai_delivery/ui/views/returned/models/returned_model.dart';

class ReturnedRepositoryImplementation {
  final _apiService = locator<ApiService>();

  Future<List<Returned>> getProcessingOrders() async {
    try {
      return await _apiService.getReturnedOrders();
    } on DioException {
      rethrow;
    }
  }
}
