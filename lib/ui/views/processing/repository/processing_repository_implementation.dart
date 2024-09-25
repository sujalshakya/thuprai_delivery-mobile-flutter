import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';
import 'package:thuprai_delivery/ui/views/processing/models/processing_model.dart';

class ProcessingRepositoryImplementation {
  final _apiService = locator<ApiService>();

  Future<List<Processing>> getProcessingOrders() async {
    try {
      return await _apiService.getProcessingOrders();
    } on DioException {
      rethrow;
    }
  }
}
