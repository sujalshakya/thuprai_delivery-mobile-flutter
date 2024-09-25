import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';
import 'package:thuprai_delivery/ui/views/pending/models/pending_model.dart';

class PendingRepositoryImplementation {
  final _apiService = locator<ApiService>();

  Future<List<Pending>> getPendingOrders() async {
    try {
      return await _apiService.getPendingOrders();
    } on DioException {
      rethrow;
    }
  }
}
