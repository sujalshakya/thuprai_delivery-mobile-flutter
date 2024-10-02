import 'package:dio/dio.dart';

import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/repository/order_repository_implementation.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';

class PickingUpViewModel extends BaseViewmodelWrapper {
  final _pickingupRepo = locator<OrderRepositoryImplementation>();
  List<Order> orders = [];
  List<Line> lines = [];
  List<String> partners = [];

  Future<void> getOrders() async {
    try {
      setBusy(true);
      List<Order> fetchedOrders = await _pickingupRepo.getOrders("picking-up");
      orders = fetchedOrders;
      getLines();
      getPartners();
    } on DioException catch (e) {
      dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: e.response!.data['detail']);
    }
    setBusy(false);
    rebuildUi();
  }

  void getLines() {
    for (int i = 0; i < orders.length; i++) {
      for (int j = 0; j < orders[i].lines!.length; j++) {
        lines.add(orders[i].lines![j]);
      }
    }
  }

  void getPartners() {
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].status != "Picked-Up" &&
          !partners.contains(lines[i].partner)) {
        partners.add(lines[i].partner!);
      }
    }
  }

  void navigateToPickupDetailsView(String partner) {
    navigationService.navigateToPickupDetailsView(partner: partner);
  }
}
