import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/pending/models/pending_model.dart';
import 'package:thuprai_delivery/ui/views/pending/repository/pending_repository_implementation.dart';

class PendingViewmodel extends BaseViewModel {
  final _processRepo = locator<PendingRepositoryImplementation>();
  final _dialogService = locator<DialogService>();
  List<Pending> orders = [];

  Future<void> getOrders() async {
    setBusy(true);

    try {
      List<Pending> fetchedOrders = await _processRepo.getPendingOrders();
      orders = fetchedOrders;
    } on DioException catch (e) {
      _dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: e.response!.data['detail']);
    }
    setBusy(false);

    rebuildUi();
  }
}
