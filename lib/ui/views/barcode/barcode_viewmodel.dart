import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';
import 'package:thuprai_delivery/ui/views/barcode/model/barcode_model.dart';

class BarcodeViewModel extends BaseViewmodelWrapper {
  void leadingTap() {
    navigationService.back();
  }

  void delete(List<BarcodeISbn> barcodes) {
    barcodes.clear();
    rebuildUi();
  }

  void scanner() {
    navigationService.navigateToScannerView();
  }
}
