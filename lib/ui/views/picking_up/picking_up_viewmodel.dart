import 'package:dio/dio.dart';

import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';
import 'package:thuprai_delivery/ui/views/picking_up/models/picking_up_model.dart';
import 'package:thuprai_delivery/ui/views/picking_up/repository/picking_up_repository_implementation.dart';

class PickingUpViewModel extends BaseViewmodelWrapper {
  final _pickingupRepo = locator<PickingUpRepositoryImplementation>();
  List<PickingUp> orders = [];
  List<Line> lines = [];

  Future<void> getOrders() async {
    try {
      setBusy(true);

      List<PickingUp> fetchedOrders = await _pickingupRepo.getPickingUpOrders();
      orders = fetchedOrders;
    } on DioException catch (e) {
      dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: e.response!.data['detail']);
    }
    setBusy(false);

    rebuildUi();
  }
}
