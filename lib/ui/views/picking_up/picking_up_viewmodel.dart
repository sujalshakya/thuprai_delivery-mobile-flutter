import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/picking_up/models/pickingup_model.dart';
import 'package:thuprai_delivery/ui/views/picking_up/repository/picking_up_repository_implementation.dart';

class PickingUpViewModel extends BaseViewModel {
  final _pickingupRepo = locator<PickingUpRepositoryImplementation>();
  List<PickingUp> orders = [];

  Future<void> getOrders() async {
    List<PickingUp> fetchedOrders = await _pickingupRepo.getPickingUpOrders();
    orders = fetchedOrders;
    rebuildUi();
  }
}
