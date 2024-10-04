import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';

class BarcodeViewModel extends BaseViewmodelWrapper {
  List<Barcode> barcodes = [];

  void leadingTap() {
    navigationService.back();
  }

  void scanner() {
    navigationService.navigateToScannerView();
  }
}
