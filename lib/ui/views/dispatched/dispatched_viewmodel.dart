import 'package:dio/dio.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';
import 'package:thuprai_delivery/ui/views/dispatched/repository/order_dispatched_repository_implementation.dart';

class DispatchedViewModel extends BaseViewmodelWrapper {
  final _dispatchRepo = locator<OrderDispatchedRepositoryImplementation>();

  List<Order> orders = [];

  Future<void> getOrders() async {
    setBusy(true);
    try {
      List<Order> fetchedOrders = await _dispatchRepo.getDispatchedOrders();
      orders = fetchedOrders;
    } on DioException catch (e) {
      dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: e.response!.data['detail']);
    }
    setBusy(false);

    rebuildUi();
  }

  void navigateToOrderDetailsView(Order order, String price) {
    navigationService.navigateToOrderDetailsView(
        order: order, price: price, orderDispatch: true);
  }
}
