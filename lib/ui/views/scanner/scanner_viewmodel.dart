import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';
import 'package:thuprai_delivery/ui/views/barcode/model/barcode_model.dart';

class ScannerViewModel extends BaseViewmodelWrapper {
  List<BarcodeISbn> barcodes = [];
  bool asked = false;
  String text = "";
  askQuantity(String barcode) async {
    await Future.delayed(const Duration(seconds: 1));
    final dialog = await dialogService.showCustomDialog(
      variant: DialogType.quantity,
    );

    text = "ISBN number: $barcode is added successfully";
    rebuildUi();
    if (dialog != null) {
      asked = true;
      barcodes.add(
        BarcodeISbn(quantity: dialog.data, barcode: barcode),
      );
    }
  }

  leadingTap() {
    navigationService.replaceWithBarcodeView(barcodes: barcodes);
  }
}
