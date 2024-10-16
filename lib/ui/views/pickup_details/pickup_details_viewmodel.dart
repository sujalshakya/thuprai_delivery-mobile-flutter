import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.bottomsheets.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/repository/order_repository_implementation.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';
import 'package:thuprai_delivery/ui/views/order_details/models/order_status_change.dart';
import 'package:thuprai_delivery/ui/views/pickup_details/repository/pickup_details_repository_implementation.dart';

class PickupDetailsViewModel extends BaseViewmodelWrapper {
  final String partner;
  final _orderRepo = locator<OrderRepositoryImplementation>();
  List<Order> orders = [];
  List<Line> lines = [];
  List<Line> books = [];
  List<Line> pickedup = [];

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

  Future<bool> changePickupStatus(int id) async {
    final pickupRepo = locator<PickupDetailsRepositoryImplementation>();

    OrderStatusChangeResponse response =
        await pickupRepo.changePickupStatus(id.toString());

    if (response.error == null) {
      bottomSheetService.showCustomSheet(
          variant: BottomSheetType.floatingBoxBottom,
          description: "Pickup Status change Sucessfull");
      pickedup.add(books.firstWhere((item) => item.id == id));
      books.removeWhere((item) => item.id == id);
      rebuildUi();
      return true;
    } else {
      bottomSheetService.showCustomSheet(
          variant: BottomSheetType.floatingBoxBottom,
          description: "Pickup Status change Error");
      return false;
    }
  }

  void getBooks(String partner) {
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].partner == partner && lines[i].status != "Picked-Up") {
        books.add(lines[i]);
      }
      if (lines[i].partner == partner && lines[i].status == "Picked-Up") {
        pickedup.add(lines[i]);
      }
    }
  }

  void leadingTap() {
    navigationService.back();
  }
}
