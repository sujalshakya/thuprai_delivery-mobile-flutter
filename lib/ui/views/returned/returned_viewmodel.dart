import 'package:dio/dio.dart';

import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';
import 'package:thuprai_delivery/ui/views/returned/repository/returned_repository_implementation.dart';

class ReturnedViewModel extends BaseViewmodelWrapper {
  final _processRepo = locator<ReturnedRepositoryImplementation>();
  List<Order> orders = [];

  Future<void> getOrders() async {
    try {
      setBusy(true);

      List<Order> fetchedOrders = await _processRepo.getProcessingOrders();
      orders = fetchedOrders;
    } on DioException catch (e) {
      dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: e.response!.data['detail']);
    }
    setBusy(false);

    rebuildUi();
  }
}
