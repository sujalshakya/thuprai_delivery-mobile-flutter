import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';
import 'package:thuprai_delivery/ui/views/picking_up/models/picking_up_model.dart';

class PickingUpRepositoryImplementation {
  final _apiService = locator<ApiService>();

  Future<List<PickingUp>> getPickingUpOrders() async {
    try {
      return await _apiService.getPickingUpOrders();
    } on DioException {
      rethrow;
    }
  }
}
