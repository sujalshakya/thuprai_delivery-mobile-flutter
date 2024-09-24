import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';
import 'package:thuprai_delivery/ui/views/couriered/models/couriered_model.dart';

class CourieredRepositoryImplementation {
  final _apiService = locator<ApiService>();

  Future<List<Couriered>> getCourieredOrders() async {
    try {
      return await _apiService.getCourieredOrders();
    } on DioException catch (e) {
      rethrow;
    }
  }
}
