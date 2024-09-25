import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/processing/models/processing_model.dart';
import 'package:thuprai_delivery/ui/views/processing/repository/processing_repository_implementation.dart';

class ProcessingViewModel extends BaseViewModel {
  final _processRepo = locator<ProcessingRepositoryImplementation>();
  final _dialogService = locator<DialogService>();
  List<Processing> orders = [];

  Future<void> getOrders() async {
    try {
      List<Processing> fetchedOrders = await _processRepo.getProcessingOrders();
      orders = fetchedOrders;
    } on DioException catch (e) {
      _dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: e.response!.data['detail']);
    }
    rebuildUi();
  }

  getPrice() {}
}
