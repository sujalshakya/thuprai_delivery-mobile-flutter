import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/couriered/models/couriered_model.dart';
import 'package:thuprai_delivery/ui/views/couriered/repository/couriered_repository_implementation.dart';

class CourieredViewModel extends BaseViewModel {
  final _processRepo = locator<CourieredRepositoryImplementation>();
  List<Couriered> orders = [];

  Future<void> getOrders() async {
    List<Couriered> fetchedOrders = await _processRepo.getCourieredOrders();
    orders = fetchedOrders;
    rebuildUi();
  }
}
