import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/pending/models/pending_model.dart';
import 'package:thuprai_delivery/ui/views/pending/repository/pending_repository_implementation.dart';

class PendingViewmodel extends BaseViewModel {
  final _processRepo = locator<PendingRepositoryImplementation>();
  List<Pending> orders = [];

  Future<void> getOrders() async {
    List<Pending> fetchedOrders = await _processRepo.getPendingOrders();
    orders = fetchedOrders;
    rebuildUi();
  }
}
