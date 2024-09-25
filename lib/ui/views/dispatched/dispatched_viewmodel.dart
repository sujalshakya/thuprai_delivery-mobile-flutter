import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/dispatched/model/order_disptached_model.dart';
import 'package:thuprai_delivery/ui/views/dispatched/repository/order_dispatched_repository_implementation.dart';

class DispatchedViewModel extends BaseViewModel {
  final _dispatchRepo = locator<OrderDispatchedRepositoryImplementation>();
  final _dialogService = locator<DialogService>();

  List<OrderDispatch> orders = [];

  Future<void> getOrders() async {
    try {
      List<OrderDispatch> fetchedOrders =
          await _dispatchRepo.getDispatchedOrders();
      orders = fetchedOrders;
    } on DioException catch (e) {
      _dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: e.response!.data['detail']);
    }
    rebuildUi();
  }
}
