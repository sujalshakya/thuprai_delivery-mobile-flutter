import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/repository/order_repository_implementation.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';

class CourieredViewModel extends BaseViewmodelWrapper {
  final _processRepo = locator<OrderRepositoryImplementation>();
  List<Order> orders = [];

  Future<void> getOrders() async {
    try {
      setBusy(true);

      List<Order> fetchedOrders = await _processRepo.getOrders("couriered");
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
