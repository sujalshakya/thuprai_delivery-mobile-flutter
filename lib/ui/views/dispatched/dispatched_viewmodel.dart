import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/dispatched/model/order_disptached_model.dart';
import 'package:thuprai_delivery/ui/views/dispatched/repository/order_dispatched_repository_implementation.dart';

class DispatchedViewModel extends BaseViewModel {
  final _dispatchRepo = locator<OrderDispatchedRepositoryImplementation>();
  List<OrderDispatch> orders = [];

  Future<void> getOrders() async {
    List<OrderDispatch> fetchedOrders =
        await _dispatchRepo.getDispatchedOrders();
    orders = fetchedOrders;
    rebuildUi();
  }
}
