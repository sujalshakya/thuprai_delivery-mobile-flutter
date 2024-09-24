import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/processing/models/processing_model.dart';
import 'package:thuprai_delivery/ui/views/processing/repository/processing_repository_implementation.dart';

class ProcessingViewModel extends BaseViewModel {
  final _processRepo = locator<ProcessingRepositoryImplementation>();
  List<Processing> orders = [];

  Future<void> getOrders() async {
    List<Processing> fetchedOrders = await _processRepo.getProcessingOrders();
    orders = fetchedOrders;
    rebuildUi();
  }
}
