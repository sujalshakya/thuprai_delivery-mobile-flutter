import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/repository/order_repository_implementation.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';

class PickupDetailsViewModel extends BaseViewmodelWrapper {
  final String partner;
  final _orderRepo = locator<OrderRepositoryImplementation>();
  List<Order> orders = [];
  List<Line> lines = [];
  List<Line> books = [];

  PickupDetailsViewModel({required this.partner});
  Future<void> getOrders(String partner) async {
    try {
      setBusy(true);
      List<Order> fetchedOrders = await _orderRepo.getOrders("picking-up");
      orders = fetchedOrders;
      getLines();
      getBooks(partner);
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

  void getBooks(String partner) {
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].partner == partner && lines[i].status != "Picked-Up") {
        books.add(lines[i]);
      }
    }
  }

  void leadingTap() {
    navigationService.back();
  }
}
