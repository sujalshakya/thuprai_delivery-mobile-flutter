import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/returned/models/returned_model.dart';
import 'package:thuprai_delivery/ui/views/returned/repository/returned_repository_implementation.dart';

class ReturnedViewModel extends BaseViewModel {
  final _processRepo = locator<ReturnedRepositoryImplementation>();
  List<Returned> orders = [];

  Future<void> getOrders() async {
    List<Returned> fetchedOrders = await _processRepo.getProcessingOrders();
    orders = fetchedOrders;
    rebuildUi();
  }
}
