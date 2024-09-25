import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/picking_up/models/pickingup_model.dart';
import 'package:thuprai_delivery/ui/views/picking_up/repository/picking_up_repository_implementation.dart';

class PickingUpViewModel extends BaseViewModel {
  final _pickingupRepo = locator<PickingUpRepositoryImplementation>();
  final _dialogService = locator<DialogService>();
  List<PickingUp> orders = [];

  Future<void> getOrders() async {
    try {
      List<PickingUp> fetchedOrders = await _pickingupRepo.getPickingUpOrders();
      orders = fetchedOrders;
    } on DioException catch (e) {
      _dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: e.response!.data['detail']);
    }
    rebuildUi();
  }
}
