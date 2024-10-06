import 'package:dio/dio.dart';

import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';

class ReturnedViewModel extends BaseViewmodelWrapper {
  List<Order> orders = [];

  Future<void> getOrders() async {
    try {
      setBusy(true);

      List<Order> fetchedOrders = await orderRepo.getOrders('returned');
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
