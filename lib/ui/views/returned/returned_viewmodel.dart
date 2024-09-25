import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/returned/models/returned_model.dart';
import 'package:thuprai_delivery/ui/views/returned/repository/returned_repository_implementation.dart';

class ReturnedViewModel extends BaseViewModel {
  final _processRepo = locator<ReturnedRepositoryImplementation>();
  final _dialogService = locator<DialogService>();
  List<Returned> orders = [];

  Future<void> getOrders() async {
    try {
      List<Returned> fetchedOrders = await _processRepo.getProcessingOrders();
      orders = fetchedOrders;
    } on DioException catch (e) {
      _dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: e.response!.data['detail']);
    }
    rebuildUi();
  }
}
