import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/couriered/models/couriered_model.dart';
import 'package:thuprai_delivery/ui/views/couriered/repository/couriered_repository_implementation.dart';

class CourieredViewModel extends BaseViewModel {
  final _processRepo = locator<CourieredRepositoryImplementation>();
  final _dialogService = locator<DialogService>();
  List<Couriered> orders = [];

  Future<void> getOrders() async {
    try {
      List<Couriered> fetchedOrders = await _processRepo.getCourieredOrders();
      orders = fetchedOrders;
    } on DioException catch (e) {
      _dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: e.response!.data['detail']);
    }
    rebuildUi();
  }
}
