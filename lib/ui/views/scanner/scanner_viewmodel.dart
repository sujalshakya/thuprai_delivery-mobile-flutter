import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';
import 'package:thuprai_delivery/ui/views/barcode/model/barcode_model.dart';

class ScannerViewModel extends BaseViewmodelWrapper {
  List<BarcodeISbn> barcodes = [];
  bool asked = false;
  String text = "";
  askQuantity(String barcode) async {
    final dialog = await dialogService.showCustomDialog(
      variant: DialogType.quantity,
    );
    barcodes.add(
      BarcodeISbn(quantity: dialog.toString(), barcode: barcode),
    );
    text = "ISBN number: $barcode is added successfully";
    rebuildUi();
    if (dialog != null) {
      asked = true;
    }
  }

  leadingTap() {
    navigationService.back();
  }
}
