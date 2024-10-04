import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';

class BarcodeViewModel extends BaseViewmodelWrapper {
  void leadingTap() {
    navigationService.back();
  }

  void scanner() {
    navigationService.navigateToScannerView();
  }
}
